#!/usr/bin/env bash

set -Eeuo pipefail

readonly APP_ROOT='/var/www/jamyfashionsug'
readonly DOMAIN='jamyfashionsug.syntaxsystems.co'
readonly WEB_GROUP='www-data'
readonly RELEASE_ID="${1:-}"
readonly ARCHIVE_PATH="${2:-}"

if [[ ! "${RELEASE_ID}" =~ ^[a-f0-9]{40}$ ]]; then
    echo 'The release identifier must be a full Git commit SHA.' >&2
    exit 1
fi

if [[ "${ARCHIVE_PATH}" != "${APP_ROOT}/incoming/${RELEASE_ID}.tar.gz" ]] || [[ ! -f "${ARCHIVE_PATH}" ]]; then
    echo 'The expected release archive was not found.' >&2
    exit 1
fi

readonly RELEASE_PATH="${APP_ROOT}/releases/${RELEASE_ID}"
readonly CURRENT_PATH="${APP_ROOT}/current"
readonly SHARED_PATH="${APP_ROOT}/shared"
previous_release="$(readlink -f "${CURRENT_PATH}" 2>/dev/null || true)"
release_activated=false

clean_failed_release() {
    rm -f "${APP_ROOT}/.current-${RELEASE_ID}" "${APP_ROOT}/.rollback-${RELEASE_ID}"

    if [[ "${release_activated}" != true ]]; then
        rm -rf -- "${RELEASE_PATH}"
    fi
}

if [[ -e "${RELEASE_PATH}" ]]; then
    echo "Release ${RELEASE_ID} already exists." >&2
    exit 1
fi

mkdir -m 0755 "${RELEASE_PATH}"
trap clean_failed_release EXIT
tar -xzf "${ARCHIVE_PATH}" -C "${RELEASE_PATH}"
rm -f "${ARCHIVE_PATH}"

if [[ ! -f "${RELEASE_PATH}/vendor/autoload.php" ]] || [[ ! -f "${RELEASE_PATH}/public/build/manifest.json" ]]; then
    echo 'The release is missing its PHP dependencies or frontend build.' >&2
    exit 1
fi

ln -s "${SHARED_PATH}/.env" "${RELEASE_PATH}/.env"
ln -s "${SHARED_PATH}/storage" "${RELEASE_PATH}/storage"
ln -s "${SHARED_PATH}/storage/app/public" "${RELEASE_PATH}/public/storage"

chgrp -R "${WEB_GROUP}" "${RELEASE_PATH}/bootstrap/cache"
chmod -R g+rwX "${RELEASE_PATH}/bootstrap/cache"

cd "${RELEASE_PATH}"
php artisan migrate --force --no-interaction
php artisan optimize

temporary_link="${APP_ROOT}/.current-${RELEASE_ID}"
ln -s "${RELEASE_PATH}" "${temporary_link}"
mv -Tf "${temporary_link}" "${CURRENT_PATH}"

is_healthy=false

for attempt in {1..10}; do
    if curl --fail --silent --show-error \
        --header "Host: ${DOMAIN}" \
        'http://127.0.0.1/up' >/dev/null; then
        is_healthy=true
        break
    fi

    sleep 2
done

if [[ "${is_healthy}" != true ]]; then
    if [[ -n "${previous_release}" ]] && [[ -d "${previous_release}" ]]; then
        rollback_link="${APP_ROOT}/.rollback-${RELEASE_ID}"
        ln -s "${previous_release}" "${rollback_link}"
        mv -Tf "${rollback_link}" "${CURRENT_PATH}"
    else
        rm -f "${CURRENT_PATH}"
    fi

    echo 'The release failed its health check and was rolled back.' >&2
    exit 1
fi

release_activated=true

mapfile -t stale_releases < <(
    find "${APP_ROOT}/releases" -mindepth 1 -maxdepth 1 -type d -printf '%T@ %p\n' \
        | sort -nr \
        | tail -n +6 \
        | cut -d' ' -f2-
)

for stale_release in "${stale_releases[@]}"; do
    if [[ "${stale_release}" != "$(readlink -f "${CURRENT_PATH}")" ]]; then
        rm -rf -- "${stale_release}"
    fi
done

echo "Release ${RELEASE_ID} is live."
