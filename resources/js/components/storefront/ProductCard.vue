<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import { ArrowRight, ArrowUpRight, MessageCircle } from '@lucide/vue';
import { computed } from 'vue';
import { show } from '@/actions/App/Http/Controllers/StorefrontController';
import { productWhatsappUrl } from '@/data/storefront';
import type { Product } from '@/types/storefront';

const props = defineProps<{
    product: Product;
}>();

const formattedPrice = new Intl.NumberFormat('en-US').format(
    props.product.price,
);

const productEnquiryUrl = computed(() => {
    const relativeProductUrl = show.url(props.product.id);
    const absoluteProductUrl =
        typeof window === 'undefined'
            ? relativeProductUrl
            : new URL(relativeProductUrl, window.location.origin).toString();

    return productWhatsappUrl(props.product, absoluteProductUrl);
});
</script>

<template>
    <article class="group flex min-w-0 flex-col">
        <div class="relative aspect-[4/5] overflow-hidden bg-brand-cream-deep">
            <Link
                :href="show(product.id)"
                :aria-label="`View ${product.name}`"
                class="block h-full focus-visible:outline-2 focus-visible:-outline-offset-2 focus-visible:outline-brand-gold"
            >
                <img
                    :src="product.image"
                    :alt="product.imageAlt"
                    width="1080"
                    height="1080"
                    loading="lazy"
                    class="h-full w-full object-cover transition duration-700 ease-out group-hover:scale-[1.025]"
                />
                <img
                    v-if="product.gallery[1]"
                    :src="product.gallery[1]"
                    :alt="`${product.name}, alternate view`"
                    width="1080"
                    height="1080"
                    loading="lazy"
                    class="absolute inset-0 h-full w-full object-cover opacity-0 transition duration-500 group-hover:opacity-100"
                />
            </Link>
            <span
                v-if="product.badge"
                class="pointer-events-none absolute top-3 left-3 bg-brand-cream px-3 py-1.5 text-[0.65rem] font-bold tracking-[0.16em] text-brand-navy uppercase"
            >
                {{ product.badge }}
            </span>
            <a
                :href="productEnquiryUrl"
                target="_blank"
                rel="noopener noreferrer"
                :aria-label="`Ask about ${product.name} on WhatsApp`"
                class="absolute right-3 bottom-3 flex size-11 translate-y-2 items-center justify-center rounded-full bg-brand-navy text-white opacity-0 shadow-lg transition duration-300 group-hover:translate-y-0 group-hover:opacity-100 focus:translate-y-0 focus:opacity-100 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-gold"
            >
                <MessageCircle class="size-5" aria-hidden="true" />
            </a>
        </div>

        <div class="flex flex-1 flex-col gap-3 pt-5">
            <div class="flex items-start justify-between gap-4">
                <div>
                    <p
                        class="mb-1 text-[0.68rem] font-bold tracking-[0.18em] text-brand-gold-dark uppercase"
                    >
                        {{ product.category }}
                    </p>
                    <h3 class="font-display text-xl text-brand-navy">
                        <Link
                            :href="show(product.id)"
                            class="transition hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                        >
                            {{ product.name }}
                        </Link>
                    </h3>
                </div>
                <p class="shrink-0 text-sm font-bold text-brand-navy">
                    UGX {{ formattedPrice }}
                </p>
            </div>
            <p class="text-sm leading-6 text-brand-muted">
                {{ product.description }}
            </p>
            <div
                class="mt-auto flex flex-wrap items-center justify-between gap-4"
            >
                <Link
                    :href="show(product.id)"
                    class="inline-flex items-center gap-2 border-b border-brand-navy/25 pb-1 text-xs font-bold tracking-[0.12em] text-brand-navy uppercase transition hover:border-brand-gold hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                >
                    View details
                    <ArrowRight class="size-4" aria-hidden="true" />
                </Link>
                <a
                    :href="productEnquiryUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="inline-flex items-center gap-2 border-b border-brand-gold pb-1 text-xs font-bold tracking-[0.12em] text-brand-navy uppercase transition hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                >
                    WhatsApp
                    <ArrowUpRight class="size-4" aria-hidden="true" />
                </a>
            </div>
        </div>
    </article>
</template>
