#!/usr/bin/env bash

set -Eeuo pipefail

readonly APP_ROOT='/var/www/jamyfashionsug'
readonly DEPLOY_USER='deployer'
readonly WEB_GROUP='www-data'
readonly DOMAIN='jamyfashionsug.syntaxsystems.co'
readonly SCRIPT_DIRECTORY="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly DEPLOY_PUBLIC_KEY="${1:-}"

if [[ "${EUID}" -ne 0 ]]; then
    echo 'Run this provisioning script as root.' >&2
    exit 1
fi

if [[ ! "${DEPLOY_PUBLIC_KEY}" =~ ^(ssh-ed25519|ssh-rsa)[[:space:]]+[A-Za-z0-9+/=]+([[:space:]].*)?$ ]]; then
    echo "Usage: $0 'ssh-ed25519 AAAA... github-actions-jamy'" >&2
    exit 1
fi

for required_command in curl php nginx systemctl; do
    if ! command -v "${required_command}" >/dev/null 2>&1; then
        echo "Missing required command: ${required_command}" >&2
        exit 1
    fi
done

if [[ ! -S /run/php/php8.4-fpm.sock ]]; then
    echo 'PHP-FPM socket /run/php/php8.4-fpm.sock was not found.' >&2
    exit 1
fi

required_php_modules=(ctype curl dom fileinfo filter mbstring openssl pcre PDO pdo_sqlite session tokenizer xml)
installed_php_modules="$(php -m | tr '[:upper:]' '[:lower:]')"

for php_module in "${required_php_modules[@]}"; do
    if ! grep -qx "$(tr '[:upper:]' '[:lower:]' <<< "${php_module}")" <<< "${installed_php_modules}"; then
        echo "Missing required PHP module: ${php_module}" >&2
        exit 1
    fi
done

if ! id "${DEPLOY_USER}" >/dev/null 2>&1; then
    useradd --create-home --shell /bin/bash "${DEPLOY_USER}"
fi

usermod --append --groups "${WEB_GROUP}" "${DEPLOY_USER}"

install -d -m 0700 -o "${DEPLOY_USER}" -g "${DEPLOY_USER}" "/home/${DEPLOY_USER}/.ssh"
touch "/home/${DEPLOY_USER}/.ssh/authorized_keys"
chown "${DEPLOY_USER}:${DEPLOY_USER}" "/home/${DEPLOY_USER}/.ssh/authorized_keys"
chmod 0600 "/home/${DEPLOY_USER}/.ssh/authorized_keys"

if ! grep -qxF "${DEPLOY_PUBLIC_KEY}" "/home/${DEPLOY_USER}/.ssh/authorized_keys"; then
    printf '%s\n' "${DEPLOY_PUBLIC_KEY}" >> "/home/${DEPLOY_USER}/.ssh/authorized_keys"
fi

install -d -m 0755 -o "${DEPLOY_USER}" -g "${WEB_GROUP}" \
    "${APP_ROOT}" \
    "${APP_ROOT}/incoming" \
    "${APP_ROOT}/releases" \
    "${APP_ROOT}/shared" \
    "${APP_ROOT}/shared/database"

install -d -m 2775 -o "${DEPLOY_USER}" -g "${WEB_GROUP}" \
    "${APP_ROOT}/shared/storage/app/private" \
    "${APP_ROOT}/shared/storage/app/public" \
    "${APP_ROOT}/shared/storage/framework/cache/data" \
    "${APP_ROOT}/shared/storage/framework/sessions" \
    "${APP_ROOT}/shared/storage/framework/views" \
    "${APP_ROOT}/shared/storage/logs"

if [[ ! -f "${APP_ROOT}/shared/.env" ]]; then
    cp "${SCRIPT_DIRECTORY}/production.env.example" "${APP_ROOT}/shared/.env"
    generated_app_key="base64:$(php -r 'echo base64_encode(random_bytes(32));')"
    sed -i "s|^APP_KEY=$|APP_KEY=${generated_app_key}|" "${APP_ROOT}/shared/.env"
fi

touch "${APP_ROOT}/shared/database/database.sqlite"
chown "${DEPLOY_USER}:${WEB_GROUP}" \
    "${APP_ROOT}/shared/.env" \
    "${APP_ROOT}/shared/database/database.sqlite"
chmod 0640 "${APP_ROOT}/shared/.env"
chmod 0660 "${APP_ROOT}/shared/database/database.sqlite"

if [[ ! -f "/etc/nginx/sites-available/${DOMAIN}" ]]; then
    install -m 0644 \
        "${SCRIPT_DIRECTORY}/nginx/${DOMAIN}.conf" \
        "/etc/nginx/sites-available/${DOMAIN}"
fi
ln -sfn "/etc/nginx/sites-available/${DOMAIN}" "/etc/nginx/sites-enabled/${DOMAIN}"

nginx -t
systemctl reload nginx

echo "Provisioning complete for ${DOMAIN}."
echo 'The application is ready for its first GitHub Actions release.'
