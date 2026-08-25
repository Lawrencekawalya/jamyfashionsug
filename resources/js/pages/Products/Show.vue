<script setup lang="ts">
import { Head, Link } from '@inertiajs/vue3';
import {
    ArrowLeft,
    ArrowRight,
    Check,
    ChevronRight,
    MessageCircle,
    PackageCheck,
    ShieldCheck,
    ShoppingBag,
    Sparkles,
} from '@lucide/vue';
import { computed, ref } from 'vue';
import {
    index,
    show,
} from '@/actions/App/Http/Controllers/StorefrontController';
import ProductCard from '@/components/storefront/ProductCard.vue';
import { business, productWhatsappUrl } from '@/data/storefront';
import type { Product } from '@/types/storefront';

const props = defineProps<{
    product: Product;
    relatedProducts: Product[];
}>();

const selectedImage = ref(props.product.gallery[0] ?? props.product.image);
const formattedPrice = new Intl.NumberFormat('en-US').format(
    props.product.price,
);
const currentYear = new Date().getFullYear();

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
    <div class="min-h-screen bg-brand-cream font-sans text-brand-ink">
        <Head :title="product.name">
            <meta
                head-key="description"
                name="description"
                :content="`${product.description} View details and order from Jamy Fashion's UG on WhatsApp.`"
            />
            <meta head-key="theme-color" name="theme-color" content="#0D274D" />
            <meta
                head-key="og-title"
                property="og:title"
                :content="product.name"
            />
            <meta
                head-key="og-description"
                property="og:description"
                :content="product.description"
            />
            <meta
                head-key="og-image"
                property="og:image"
                :content="product.image"
            />
            <link rel="preconnect" href="https://fonts.googleapis.com" />
            <link
                rel="preconnect"
                href="https://fonts.gstatic.com"
                crossorigin="anonymous"
            />
            <link
                href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&display=swap"
                rel="stylesheet"
            />
        </Head>

        <a
            href="#product-content"
            class="sr-only z-[100] bg-brand-gold px-4 py-3 font-bold text-brand-navy focus:not-sr-only focus:fixed focus:top-3 focus:left-3"
        >
            Skip to product details
        </a>

        <div
            class="bg-brand-navy px-5 py-2.5 text-center text-[0.68rem] font-semibold tracking-[0.16em] text-white uppercase"
        >
            See it · Love it · Message us to order
        </div>

        <header class="border-b border-brand-navy/10 bg-brand-cream">
            <div
                class="mx-auto flex h-20 max-w-7xl items-center justify-between gap-5 px-5 sm:px-8 lg:px-10"
            >
                <Link
                    :href="index()"
                    aria-label="Jamy Fashion's UG home"
                    class="focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                >
                    <img
                        src="/images/storefront/logo/jamy-fashions-logo.svg"
                        alt="Jamy Fashion's UG"
                        width="440"
                        height="156"
                        class="h-14 w-auto"
                    />
                </Link>
                <div class="flex items-center gap-3 sm:gap-6">
                    <Link
                        :href="`${index.url()}#new-arrivals`"
                        class="hidden text-xs font-bold tracking-[0.12em] text-brand-navy uppercase transition hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold sm:inline-flex"
                    >
                        Back to collection
                    </Link>
                    <a
                        :href="productEnquiryUrl"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="inline-flex items-center gap-2 bg-brand-navy px-4 py-3 text-[0.68rem] font-bold tracking-[0.1em] text-white uppercase transition hover:bg-brand-navy-light focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold sm:px-5"
                    >
                        <MessageCircle class="size-4" aria-hidden="true" />
                        <span class="hidden sm:inline">Order on WhatsApp</span>
                        <span class="sm:hidden">Order</span>
                    </a>
                </div>
            </div>
        </header>

        <main id="product-content">
            <div class="mx-auto max-w-7xl px-5 py-6 sm:px-8 lg:px-10">
                <nav
                    aria-label="Breadcrumb"
                    class="flex flex-wrap items-center gap-2 text-xs text-brand-muted"
                >
                    <Link
                        :href="index()"
                        class="transition hover:text-brand-navy"
                        >Home</Link
                    >
                    <ChevronRight class="size-3.5" aria-hidden="true" />
                    <Link
                        :href="`${index.url()}#new-arrivals`"
                        class="transition hover:text-brand-navy"
                    >
                        Collection
                    </Link>
                    <ChevronRight class="size-3.5" aria-hidden="true" />
                    <span class="text-brand-navy" aria-current="page">{{
                        product.name
                    }}</span>
                </nav>
            </div>

            <section class="px-5 pb-20 sm:px-8 lg:px-10">
                <div
                    class="mx-auto grid max-w-7xl gap-10 lg:grid-cols-[1.05fr_0.95fr] lg:gap-16"
                >
                    <div>
                        <div
                            class="grid gap-4"
                            :class="
                                product.gallery.length > 1
                                    ? 'sm:grid-cols-[5rem_1fr]'
                                    : 'sm:grid-cols-1'
                            "
                        >
                            <div
                                v-if="product.gallery.length > 1"
                                class="order-2 flex gap-3 sm:order-1 sm:flex-col"
                                aria-label="Product images"
                            >
                                <button
                                    v-for="(
                                        image, imageIndex
                                    ) in product.gallery"
                                    :key="image"
                                    type="button"
                                    :aria-label="`Show product image ${imageIndex + 1}`"
                                    :aria-pressed="selectedImage === image"
                                    class="aspect-square w-20 overflow-hidden border-2 bg-white transition focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-gold"
                                    :class="
                                        selectedImage === image
                                            ? 'border-brand-gold'
                                            : 'border-transparent hover:border-brand-navy/25'
                                    "
                                    @click="selectedImage = image"
                                >
                                    <img
                                        :src="image"
                                        alt=""
                                        class="h-full w-full object-cover"
                                    />
                                </button>
                            </div>

                            <div
                                class="relative order-1 aspect-[4/5] overflow-hidden bg-brand-cream-deep sm:order-2"
                            >
                                <img
                                    :src="selectedImage"
                                    :alt="product.imageAlt"
                                    class="h-full w-full object-cover"
                                    fetchpriority="high"
                                />
                                <span
                                    v-if="product.badge"
                                    class="absolute top-4 left-4 bg-brand-cream px-4 py-2 text-[0.68rem] font-bold tracking-[0.16em] text-brand-navy uppercase"
                                >
                                    {{ product.badge }}
                                </span>
                            </div>
                        </div>
                        <p class="mt-4 text-center text-xs text-brand-muted">
                            <span v-if="product.gallery.length > 1"
                                >Select a thumbnail to see another view.</span
                            >
                            <span v-else>Product presentation image.</span>
                        </p>
                    </div>

                    <div class="lg:sticky lg:top-8 lg:self-start">
                        <Link
                            :href="`${index.url()}#new-arrivals`"
                            class="mb-6 inline-flex items-center gap-2 text-xs font-bold tracking-[0.13em] text-brand-gold-dark uppercase transition hover:text-brand-navy"
                        >
                            <ArrowLeft class="size-4" aria-hidden="true" />
                            {{ product.category }} collection
                        </Link>

                        <h1
                            class="font-display text-4xl leading-tight text-brand-navy sm:text-5xl"
                        >
                            {{ product.name }}
                        </h1>
                        <p class="mt-4 text-base leading-7 text-brand-muted">
                            {{ product.description }}
                        </p>

                        <div class="my-7 border-y border-brand-navy/12 py-6">
                            <div
                                class="flex flex-wrap items-end justify-between gap-4"
                            >
                                <div>
                                    <p
                                        class="text-[0.65rem] font-bold tracking-[0.16em] text-brand-gold-dark uppercase"
                                    >
                                        Sample price
                                    </p>
                                    <p
                                        class="mt-1 font-display text-4xl text-brand-navy"
                                    >
                                        UGX {{ formattedPrice }}
                                    </p>
                                </div>
                                <div
                                    class="flex items-center gap-2 text-sm font-semibold text-[#1F7A48]"
                                >
                                    <span
                                        class="size-2 rounded-full bg-[#1F9D55]"
                                    />
                                    Confirm availability
                                </div>
                            </div>
                        </div>

                        <div>
                            <p
                                class="text-xs font-bold tracking-[0.13em] text-brand-navy uppercase"
                            >
                                Available colour presentation
                            </p>
                            <div class="mt-3 flex flex-wrap gap-2">
                                <span
                                    v-for="colour in product.colours"
                                    :key="colour"
                                    class="border border-brand-navy/20 bg-white px-4 py-2.5 text-sm text-brand-navy"
                                >
                                    {{ colour }}
                                </span>
                            </div>
                            <p class="mt-3 text-xs leading-5 text-brand-muted">
                                Ask Jamy to confirm current colours and sizes
                                before ordering.
                            </p>
                        </div>

                        <a
                            :href="productEnquiryUrl"
                            target="_blank"
                            rel="noopener noreferrer"
                            class="mt-7 flex w-full items-center justify-center gap-3 bg-[#1F9D55] px-7 py-5 text-sm font-bold tracking-[0.12em] text-white uppercase shadow-[0_15px_35px_rgba(31,157,85,0.18)] transition hover:bg-[#178047] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                        >
                            <MessageCircle class="size-5" aria-hidden="true" />
                            Ask about this item on WhatsApp
                        </a>
                        <p
                            class="mt-3 text-center text-xs leading-5 text-brand-muted"
                        >
                            Your message includes this product's name, price and
                            page link.
                        </p>

                        <div
                            class="mt-8 grid gap-px overflow-hidden border border-brand-navy/10 bg-brand-navy/10 sm:grid-cols-3"
                        >
                            <div class="bg-white p-5">
                                <ShoppingBag
                                    class="mb-3 size-5 text-brand-gold-dark"
                                    aria-hidden="true"
                                />
                                <p class="text-sm font-bold text-brand-navy">
                                    Direct ordering
                                </p>
                                <p
                                    class="mt-1 text-xs leading-5 text-brand-muted"
                                >
                                    Speak with Jamy personally.
                                </p>
                            </div>
                            <div class="bg-white p-5">
                                <PackageCheck
                                    class="mb-3 size-5 text-brand-gold-dark"
                                    aria-hidden="true"
                                />
                                <p class="text-sm font-bold text-brand-navy">
                                    Confirm delivery
                                </p>
                                <p
                                    class="mt-1 text-xs leading-5 text-brand-muted"
                                >
                                    Agree on the best option.
                                </p>
                            </div>
                            <div class="bg-white p-5">
                                <ShieldCheck
                                    class="mb-3 size-5 text-brand-gold-dark"
                                    aria-hidden="true"
                                />
                                <p class="text-sm font-bold text-brand-navy">
                                    Confirm details
                                </p>
                                <p
                                    class="mt-1 text-xs leading-5 text-brand-muted"
                                >
                                    Check size and colour first.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section
                class="border-y border-brand-navy/10 bg-white px-5 py-16 sm:px-8 lg:px-10"
            >
                <div
                    class="mx-auto grid max-w-7xl gap-12 lg:grid-cols-[0.8fr_1.2fr]"
                >
                    <div>
                        <p
                            class="mb-3 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                        >
                            The details
                        </p>
                        <h2 class="font-display text-4xl text-brand-navy">
                            About this piece
                        </h2>
                    </div>
                    <div>
                        <p class="text-base leading-8 text-brand-muted">
                            {{ product.longDescription }}
                        </p>
                        <ul class="mt-7 grid gap-3 sm:grid-cols-2">
                            <li
                                v-for="detail in product.details"
                                :key="detail"
                                class="flex items-start gap-3 border-t border-brand-navy/10 pt-3 text-sm text-brand-navy"
                            >
                                <Check
                                    class="mt-0.5 size-4 shrink-0 text-brand-gold-dark"
                                    aria-hidden="true"
                                />
                                {{ detail }}
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <section
                v-if="relatedProducts.length"
                class="px-5 py-20 sm:px-8 sm:py-28 lg:px-10"
            >
                <div class="mx-auto max-w-7xl">
                    <div
                        class="mb-11 flex flex-col justify-between gap-5 sm:flex-row sm:items-end"
                    >
                        <div>
                            <p
                                class="mb-3 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                            >
                                You may also like
                            </p>
                            <h2 class="font-display text-4xl text-brand-navy">
                                More from {{ product.category }}
                            </h2>
                        </div>
                        <Link
                            :href="`${index.url()}#new-arrivals`"
                            class="inline-flex items-center gap-2 text-xs font-bold tracking-[0.13em] text-brand-navy uppercase"
                        >
                            View collection
                            <ArrowRight class="size-4" aria-hidden="true" />
                        </Link>
                    </div>
                    <div
                        class="grid gap-x-6 gap-y-12 sm:grid-cols-2 lg:grid-cols-3"
                    >
                        <ProductCard
                            v-for="relatedProduct in relatedProducts.slice(
                                0,
                                3,
                            )"
                            :key="relatedProduct.id"
                            :product="relatedProduct"
                        />
                    </div>
                </div>
            </section>

            <section
                class="bg-brand-navy px-5 py-16 text-center text-white sm:px-8"
            >
                <Sparkles
                    class="mx-auto mb-5 size-6 text-brand-gold"
                    aria-hidden="true"
                />
                <h2 class="font-display text-3xl sm:text-4xl">
                    Need help choosing?
                </h2>
                <p
                    class="mx-auto mt-3 max-w-xl text-sm leading-7 text-white/65"
                >
                    Send Jamy a message and ask about styling, current colours,
                    sizing and delivery.
                </p>
                <a
                    :href="productEnquiryUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="mt-7 inline-flex items-center gap-3 border border-brand-gold px-7 py-4 text-xs font-bold tracking-[0.13em] text-white uppercase transition hover:bg-brand-gold hover:text-brand-navy"
                >
                    <MessageCircle class="size-5" aria-hidden="true" />
                    Message Jamy
                </a>
            </section>
        </main>

        <footer class="bg-[#081A31] px-5 py-8 text-white sm:px-8 lg:px-10">
            <div
                class="mx-auto flex max-w-7xl flex-col items-center justify-between gap-5 text-center sm:flex-row sm:text-left"
            >
                <Link :href="index()" aria-label="Jamy Fashion's UG home">
                    <img
                        src="/images/storefront/logo/jamy-fashions-logo.svg"
                        alt="Jamy Fashion's UG"
                        width="440"
                        height="156"
                        class="h-16 w-auto rounded-sm bg-brand-cream px-3"
                    />
                </Link>
                <div
                    class="text-[0.65rem] tracking-[0.12em] text-white/45 uppercase"
                >
                    <p>© {{ currentYear }} Jamy Fashion's UG</p>
                    <p class="mt-1">{{ business.tagline }}</p>
                </div>
            </div>
        </footer>
    </div>
</template>
