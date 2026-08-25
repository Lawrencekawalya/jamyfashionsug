<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import {
    ArrowDownRight,
    ArrowRight,
    Check,
    Footprints,
    Heart,
    Menu,
    MessageCircle,
    Music2,
    Package,
    Scissors,
    ShoppingBag,
    Sparkles,
    X,
} from '@lucide/vue';
import { ref } from 'vue';
import ProductCard from '@/components/storefront/ProductCard.vue';
import { business, navigation, whatsappUrl } from '@/data/storefront';
import type { Product } from '@/types/storefront';

defineProps<{
    products: Product[];
}>();

const isMenuOpen = ref(false);
const currentYear = new Date().getFullYear();

const generalWhatsappUrl = whatsappUrl(
    `Hello ${business.name}, I would like to browse and order from your collection.`,
);

const services = [
    {
        title: 'Ready to wear',
        description: 'Easy, elegant outfits for everyday moments.',
        icon: ShoppingBag,
    },
    {
        title: 'Hijabs & accessories',
        description: 'Finishing pieces to complete your look.',
        icon: Sparkles,
    },
    {
        title: 'Bags & footwear',
        description: 'Thoughtful additions for a complete outfit.',
        icon: Footprints,
    },
    {
        title: 'Custom outfits',
        description: 'Made with your taste and occasion in mind.',
        icon: Scissors,
    },
];
</script>

<template>
    <div
        id="home"
        class="min-h-screen overflow-x-hidden bg-brand-cream font-sans text-brand-ink"
    >
        <Head title="Modest Dresses & Hijabs">
            <meta
                head-key="description"
                name="description"
                content="Discover elegant Muslim casual dresses, abayas and hijabs from Jamy Fashion's UG. Browse the latest collection and order directly on WhatsApp."
            />
            <meta head-key="theme-color" name="theme-color" content="#0D274D" />
            <meta
                head-key="og-title"
                property="og:title"
                content="Jamy Fashion's UG — Style. Confidence. You."
            />
            <meta
                head-key="og-description"
                property="og:description"
                content="Modest everyday style, thoughtfully selected for you."
            />
            <meta
                head-key="og-image"
                property="og:image"
                content="/images/storefront/products/essential-chiffon-hijabs.webp"
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
            href="#main-content"
            class="sr-only z-[100] bg-brand-gold px-4 py-3 font-bold text-brand-navy focus:not-sr-only focus:fixed focus:top-3 focus:left-3"
        >
            Skip to content
        </a>

        <div
            class="bg-brand-navy px-5 py-2.5 text-center text-[0.68rem] font-semibold tracking-[0.16em] text-white uppercase"
        >
            New modest styles have arrived
            <span class="mx-2 text-brand-gold" aria-hidden="true">•</span>
            Order easily on WhatsApp
        </div>

        <header
            class="sticky top-0 z-50 border-b border-brand-navy/8 bg-brand-cream/95 backdrop-blur-md"
        >
            <div
                class="mx-auto flex h-20 max-w-7xl items-center justify-between gap-6 px-5 sm:px-8 lg:px-10"
            >
                <a
                    href="#home"
                    class="shrink-0 focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                    aria-label="Jamy Fashion's UG home"
                >
                    <img
                        src="/images/storefront/logo/jamy-fashions-logo.svg"
                        alt="Jamy Fashion's UG"
                        width="440"
                        height="156"
                        class="h-14 w-auto"
                    />
                </a>

                <nav
                    class="hidden items-center gap-7 lg:flex"
                    aria-label="Main navigation"
                >
                    <a
                        v-for="item in navigation"
                        :key="item.href"
                        :href="item.href"
                        class="text-xs font-bold tracking-[0.12em] text-brand-navy uppercase transition hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                    >
                        {{ item.label }}
                    </a>
                </nav>

                <a
                    :href="generalWhatsappUrl"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="hidden items-center gap-2 bg-brand-navy px-5 py-3 text-xs font-bold tracking-[0.1em] text-white uppercase transition hover:bg-brand-navy-light focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold lg:inline-flex"
                >
                    <MessageCircle class="size-4" aria-hidden="true" />
                    Order now
                </a>

                <button
                    type="button"
                    class="flex size-11 items-center justify-center text-brand-navy focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-brand-gold lg:hidden"
                    :aria-expanded="isMenuOpen"
                    aria-controls="mobile-menu"
                    aria-label="Toggle navigation"
                    @click="isMenuOpen = !isMenuOpen"
                >
                    <X v-if="isMenuOpen" class="size-6" aria-hidden="true" />
                    <Menu v-else class="size-6" aria-hidden="true" />
                </button>
            </div>

            <nav
                v-if="isMenuOpen"
                id="mobile-menu"
                class="border-t border-brand-navy/10 bg-brand-cream px-5 py-6 lg:hidden"
                aria-label="Mobile navigation"
            >
                <div class="mx-auto flex max-w-7xl flex-col gap-1">
                    <a
                        v-for="item in navigation"
                        :key="item.href"
                        :href="item.href"
                        class="border-b border-brand-navy/8 py-3 text-sm font-bold tracking-[0.1em] text-brand-navy uppercase"
                        @click="isMenuOpen = false"
                    >
                        {{ item.label }}
                    </a>
                    <a
                        :href="generalWhatsappUrl"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="mt-4 inline-flex items-center justify-center gap-2 bg-brand-navy px-5 py-3.5 text-xs font-bold tracking-[0.1em] text-white uppercase"
                    >
                        <MessageCircle class="size-4" aria-hidden="true" />
                        Order on WhatsApp
                    </a>
                </div>
            </nav>
        </header>

        <main id="main-content">
            <section class="relative isolate overflow-hidden">
                <div
                    class="absolute top-0 left-0 -z-10 h-72 w-72 -translate-x-1/2 -translate-y-1/2 rounded-full bg-brand-gold/10 blur-3xl"
                />
                <div
                    class="mx-auto grid min-h-[calc(100svh-7.5rem)] max-w-7xl items-center gap-12 px-5 py-14 sm:px-8 sm:py-20 lg:grid-cols-[0.9fr_1.1fr] lg:px-10 lg:py-16"
                >
                    <div class="max-w-2xl">
                        <div
                            class="mb-6 flex items-center gap-3 text-[0.7rem] font-bold tracking-[0.22em] text-brand-gold-dark uppercase"
                        >
                            <span class="h-px w-9 bg-brand-gold" />
                            Curated modest fashion in Uganda
                        </div>
                        <h1
                            class="font-display text-[clamp(3.45rem,8vw,7rem)] leading-[0.91] tracking-[-0.035em] text-brand-navy"
                        >
                            Modest style.
                            <span class="block text-brand-gold-dark italic">
                                Effortless
                            </span>
                            confidence.
                        </h1>
                        <p
                            class="mt-7 max-w-xl text-base leading-7 text-brand-muted sm:text-lg sm:leading-8"
                        >
                            Thoughtfully selected dresses, abayas and hijabs
                            that make everyday elegance feel beautifully simple.
                        </p>
                        <div class="mt-9 flex flex-col gap-3 sm:flex-row">
                            <a
                                href="#new-arrivals"
                                class="inline-flex items-center justify-center gap-3 bg-brand-navy px-7 py-4 text-xs font-bold tracking-[0.14em] text-white uppercase transition hover:bg-brand-navy-light focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                            >
                                Shop collection
                                <ArrowDownRight
                                    class="size-4"
                                    aria-hidden="true"
                                />
                            </a>
                            <a
                                :href="generalWhatsappUrl"
                                target="_blank"
                                rel="noopener noreferrer"
                                class="inline-flex items-center justify-center gap-3 border border-brand-navy/25 px-7 py-4 text-xs font-bold tracking-[0.14em] text-brand-navy uppercase transition hover:border-brand-navy hover:bg-white/60 focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                            >
                                <MessageCircle
                                    class="size-4"
                                    aria-hidden="true"
                                />
                                Order on WhatsApp
                            </a>
                        </div>
                        <div
                            class="mt-10 grid max-w-lg grid-cols-3 divide-x divide-brand-navy/12 border-y border-brand-navy/12 py-4"
                        >
                            <div class="pr-4">
                                <p
                                    class="font-display text-2xl text-brand-navy"
                                >
                                    Easy
                                </p>
                                <p
                                    class="mt-0.5 text-[0.65rem] tracking-wide text-brand-muted uppercase"
                                >
                                    Ordering
                                </p>
                            </div>
                            <div class="px-4">
                                <p
                                    class="font-display text-2xl text-brand-navy"
                                >
                                    Curated
                                </p>
                                <p
                                    class="mt-0.5 text-[0.65rem] tracking-wide text-brand-muted uppercase"
                                >
                                    Styles
                                </p>
                            </div>
                            <div class="pl-4">
                                <p
                                    class="font-display text-2xl text-brand-navy"
                                >
                                    Personal
                                </p>
                                <p
                                    class="mt-0.5 text-[0.65rem] tracking-wide text-brand-muted uppercase"
                                >
                                    Service
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="relative mx-auto w-full max-w-2xl lg:ml-auto">
                        <div
                            class="absolute -top-4 -right-4 size-28 border border-brand-gold/55 sm:size-40"
                        />
                        <div
                            class="relative ml-auto aspect-[5/6] w-[88%] overflow-hidden bg-brand-cream-deep sm:w-[82%]"
                        >
                            <img
                                src="/images/storefront/products/sky-blue-abaya.webp"
                                alt="Sky blue full-length abaya from Jamy Fashion's UG"
                                width="1080"
                                height="1080"
                                fetchpriority="high"
                                class="h-full w-full object-cover object-center"
                            />
                            <div
                                class="absolute inset-x-0 bottom-0 h-1/3 bg-gradient-to-t from-brand-navy/40 to-transparent"
                            />
                        </div>
                        <div
                            class="absolute bottom-6 left-0 max-w-48 bg-brand-navy p-5 text-white shadow-2xl sm:bottom-10 sm:p-6"
                        >
                            <Sparkles
                                class="mb-4 size-5 text-brand-gold"
                                aria-hidden="true"
                            />
                            <p
                                class="font-display text-xl leading-tight sm:text-2xl"
                            >
                                Style that speaks for you.
                            </p>
                            <p
                                class="mt-3 text-[0.65rem] font-bold tracking-[0.16em] text-brand-gold uppercase"
                            >
                                New season edit
                            </p>
                        </div>
                        <p
                            class="absolute top-1/2 -right-16 hidden -translate-y-1/2 rotate-90 text-[0.65rem] font-bold tracking-[0.28em] text-brand-navy/50 uppercase xl:block"
                        >
                            Jamy Fashion's UG · Kampala
                        </p>
                    </div>
                </div>
            </section>

            <section
                class="bg-brand-navy py-5 text-white"
                aria-label="Brand promise"
            >
                <div
                    class="mx-auto flex max-w-7xl flex-wrap items-center justify-center gap-x-8 gap-y-3 px-5 text-center text-[0.66rem] font-bold tracking-[0.19em] uppercase sm:px-8 lg:justify-between lg:px-10"
                >
                    <span class="flex items-center gap-2"
                        ><Check class="size-3.5 text-brand-gold" /> Modest by
                        design</span
                    >
                    <span
                        class="hidden size-1 rounded-full bg-brand-gold md:block"
                    />
                    <span class="flex items-center gap-2"
                        ><Check class="size-3.5 text-brand-gold" /> Styled for
                        everyday</span
                    >
                    <span
                        class="hidden size-1 rounded-full bg-brand-gold md:block"
                    />
                    <span class="flex items-center gap-2"
                        ><Check class="size-3.5 text-brand-gold" /> Personal
                        WhatsApp service</span
                    >
                </div>
            </section>

            <section class="px-5 py-20 sm:px-8 sm:py-28 lg:px-10">
                <div class="mx-auto max-w-7xl">
                    <div
                        class="mb-11 flex flex-col justify-between gap-5 sm:flex-row sm:items-end"
                    >
                        <div>
                            <p
                                class="mb-3 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                            >
                                Find your style
                            </p>
                            <h2
                                class="font-display text-4xl text-brand-navy sm:text-5xl"
                            >
                                Shop by category
                            </h2>
                        </div>
                        <p
                            class="max-w-md text-sm leading-6 text-brand-muted sm:text-right"
                        >
                            Pieces chosen to move easily from workdays to
                            weekends and every moment in between.
                        </p>
                    </div>

                    <div class="grid gap-5 lg:grid-cols-2">
                        <a
                            id="dresses"
                            href="#new-arrivals"
                            class="group relative scroll-mt-28 overflow-hidden bg-brand-navy focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                        >
                            <img
                                src="/images/storefront/products/terracotta-tiered-dress.webp"
                                alt="Terracotta modest dress"
                                width="1080"
                                height="1080"
                                loading="lazy"
                                class="aspect-[5/4] w-full object-cover transition duration-700 group-hover:scale-[1.025]"
                            />
                            <div
                                class="absolute inset-0 bg-gradient-to-t from-brand-navy/85 via-transparent to-transparent"
                            />
                            <div
                                class="absolute inset-x-0 bottom-0 flex items-end justify-between gap-5 p-6 text-white sm:p-9"
                            >
                                <div>
                                    <p
                                        class="mb-2 text-[0.65rem] font-bold tracking-[0.2em] text-brand-gold uppercase"
                                    >
                                        Everyday elegance
                                    </p>
                                    <h3
                                        class="font-display text-3xl sm:text-4xl"
                                    >
                                        Casual dresses
                                    </h3>
                                </div>
                                <span
                                    class="flex size-12 shrink-0 items-center justify-center rounded-full border border-white/50 transition group-hover:border-brand-gold group-hover:bg-brand-gold group-hover:text-brand-navy"
                                >
                                    <ArrowRight
                                        class="size-5"
                                        aria-hidden="true"
                                    />
                                </span>
                            </div>
                        </a>

                        <a
                            id="hijabs"
                            href="#new-arrivals"
                            class="group relative scroll-mt-28 overflow-hidden bg-brand-navy focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                        >
                            <img
                                src="/images/storefront/products/essential-chiffon-hijabs.webp"
                                alt="Black and olive chiffon hijabs"
                                width="1402"
                                height="1122"
                                loading="lazy"
                                class="aspect-[5/4] w-full object-cover transition duration-700 group-hover:scale-[1.025]"
                            />
                            <div
                                class="absolute inset-0 bg-gradient-to-t from-brand-navy/85 via-transparent to-transparent"
                            />
                            <div
                                class="absolute inset-x-0 bottom-0 flex items-end justify-between gap-5 p-6 text-white sm:p-9"
                            >
                                <div>
                                    <p
                                        class="mb-2 text-[0.65rem] font-bold tracking-[0.2em] text-brand-gold uppercase"
                                    >
                                        The perfect finish
                                    </p>
                                    <h3
                                        class="font-display text-3xl sm:text-4xl"
                                    >
                                        Hijab collection
                                    </h3>
                                </div>
                                <span
                                    class="flex size-12 shrink-0 items-center justify-center rounded-full border border-white/50 transition group-hover:border-brand-gold group-hover:bg-brand-gold group-hover:text-brand-navy"
                                >
                                    <ArrowRight
                                        class="size-5"
                                        aria-hidden="true"
                                    />
                                </span>
                            </div>
                        </a>
                    </div>
                </div>
            </section>

            <section
                id="new-arrivals"
                class="scroll-mt-24 bg-white px-5 py-20 sm:px-8 sm:py-28 lg:px-10"
            >
                <div class="mx-auto max-w-7xl">
                    <div class="mb-12 text-center">
                        <p
                            class="mb-3 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                        >
                            Freshly selected
                        </p>
                        <h2
                            class="font-display text-4xl text-brand-navy sm:text-5xl"
                        >
                            New arrivals
                        </h2>
                        <p
                            class="mx-auto mt-4 max-w-xl text-sm leading-6 text-brand-muted"
                        >
                            A small edit of graceful shapes and versatile
                            colours, ready to order directly through WhatsApp.
                        </p>
                    </div>

                    <div
                        class="grid grid-cols-1 gap-x-6 gap-y-12 sm:grid-cols-2 lg:grid-cols-3 lg:gap-y-16"
                    >
                        <ProductCard
                            v-for="product in products"
                            :key="product.id"
                            :product="product"
                        />
                    </div>

                    <div class="mt-14 text-center">
                        <a
                            :href="generalWhatsappUrl"
                            target="_blank"
                            rel="noopener noreferrer"
                            class="inline-flex items-center justify-center gap-3 border border-brand-navy px-7 py-4 text-xs font-bold tracking-[0.14em] text-brand-navy uppercase transition hover:bg-brand-navy hover:text-white focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                        >
                            Ask about the full collection
                            <ArrowRight class="size-4" aria-hidden="true" />
                        </a>
                    </div>
                </div>
            </section>

            <section
                class="border-y border-brand-navy/10 bg-brand-cream-deep px-5 py-16 sm:px-8 lg:px-10"
            >
                <div class="mx-auto max-w-7xl">
                    <div class="mb-10 text-center">
                        <p
                            class="mb-3 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                        >
                            More ways to style you
                        </p>
                        <h2
                            class="font-display text-3xl text-brand-navy sm:text-4xl"
                        >
                            Made for the whole look
                        </h2>
                    </div>
                    <div
                        class="grid gap-px overflow-hidden border border-brand-navy/10 bg-brand-navy/10 sm:grid-cols-2 lg:grid-cols-4"
                    >
                        <article
                            v-for="service in services"
                            :key="service.title"
                            class="bg-brand-cream-deep p-7 sm:p-8"
                        >
                            <component
                                :is="service.icon"
                                class="mb-5 size-6 text-brand-gold-dark"
                                aria-hidden="true"
                            />
                            <h3 class="font-display text-xl text-brand-navy">
                                {{ service.title }}
                            </h3>
                            <p class="mt-2 text-sm leading-6 text-brand-muted">
                                {{ service.description }}
                            </p>
                        </article>
                    </div>
                </div>
            </section>

            <section
                id="our-story"
                class="scroll-mt-24 overflow-hidden bg-brand-navy px-5 py-20 text-white sm:px-8 sm:py-28 lg:px-10"
            >
                <div
                    class="mx-auto grid max-w-7xl items-center gap-14 lg:grid-cols-[0.82fr_1.18fr] lg:gap-20"
                >
                    <div class="relative mx-auto w-full max-w-lg">
                        <div
                            class="absolute -top-4 -left-4 h-full w-full border border-brand-gold/45"
                        />
                        <div
                            class="relative aspect-[4/5] overflow-hidden bg-brand-cream-deep"
                        >
                            <img
                                src="/images/storefront/brand/brand-story.webp"
                                alt="Jamy Fashion's UG brand presentation"
                                width="995"
                                height="1280"
                                loading="lazy"
                                class="h-full w-full object-cover"
                            />
                        </div>
                    </div>

                    <div>
                        <p
                            class="mb-4 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold uppercase"
                        >
                            Our story
                        </p>
                        <h2
                            class="font-display text-4xl leading-tight sm:text-6xl"
                        >
                            Fashion isn't just what you wear.
                            <span class="text-brand-gold italic"
                                >It's how you express yourself.</span
                            >
                        </h2>
                        <p
                            class="mt-7 max-w-2xl text-base leading-8 text-white/72"
                        >
                            Jamy Fashion's UG is about elegance, quality and
                            style that speaks for you. We bring together trendy,
                            classy and comfortable outfits for the moments that
                            matter to you.
                        </p>
                        <div
                            class="mt-9 grid gap-6 border-t border-white/15 pt-9 sm:grid-cols-3"
                        >
                            <div>
                                <Heart
                                    class="mb-3 size-5 text-brand-gold"
                                    aria-hidden="true"
                                />
                                <h3 class="font-display text-xl">
                                    Selected with care
                                </h3>
                                <p class="mt-2 text-sm leading-6 text-white/60">
                                    Pieces chosen for comfort, coverage and
                                    confident style.
                                </p>
                            </div>
                            <div>
                                <Package
                                    class="mb-3 size-5 text-brand-gold"
                                    aria-hidden="true"
                                />
                                <h3 class="font-display text-xl">
                                    Simple to order
                                </h3>
                                <p class="mt-2 text-sm leading-6 text-white/60">
                                    See something you love and continue directly
                                    on WhatsApp.
                                </p>
                            </div>
                            <div>
                                <Sparkles
                                    class="mb-3 size-5 text-brand-gold"
                                    aria-hidden="true"
                                />
                                <h3 class="font-display text-xl">
                                    Styled for you
                                </h3>
                                <p class="mt-2 text-sm leading-6 text-white/60">
                                    Everyday looks with a polished, distinctly
                                    personal feel.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="px-5 py-20 sm:px-8 sm:py-28 lg:px-10">
                <div
                    class="mx-auto max-w-7xl overflow-hidden border border-brand-gold/40 bg-white"
                >
                    <div class="grid lg:grid-cols-[1.15fr_0.85fr]">
                        <div class="p-8 sm:p-12 lg:p-16">
                            <p
                                class="mb-4 text-[0.68rem] font-bold tracking-[0.2em] text-brand-gold-dark uppercase"
                            >
                                From your screen to your wardrobe
                            </p>
                            <h2
                                class="max-w-2xl font-display text-4xl leading-tight text-brand-navy sm:text-5xl"
                            >
                                Love a look? Ordering is only a message away.
                            </h2>
                            <p
                                class="mt-5 max-w-xl text-sm leading-7 text-brand-muted"
                            >
                                Tell us the item you like, then confirm your
                                colour, size, delivery and payment details with
                                our team.
                            </p>
                            <a
                                :href="generalWhatsappUrl"
                                target="_blank"
                                rel="noopener noreferrer"
                                class="mt-8 inline-flex items-center justify-center gap-3 bg-[#1F9D55] px-7 py-4 text-xs font-bold tracking-[0.14em] text-white uppercase transition hover:bg-[#178047] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                            >
                                <MessageCircle
                                    class="size-5"
                                    aria-hidden="true"
                                />
                                Chat on WhatsApp
                            </a>
                        </div>
                        <ol
                            class="grid bg-brand-cream-deep sm:grid-cols-3 lg:grid-cols-1"
                        >
                            <li
                                class="flex gap-5 border-b border-brand-navy/10 p-7 sm:border-r sm:border-b-0 lg:border-r-0 lg:border-b"
                            >
                                <span
                                    class="font-display text-3xl text-brand-gold-dark"
                                    >01</span
                                >
                                <div>
                                    <h3 class="font-bold text-brand-navy">
                                        Choose your item
                                    </h3>
                                    <p
                                        class="mt-1 text-sm leading-6 text-brand-muted"
                                    >
                                        Browse the collection and pick your
                                        favourite.
                                    </p>
                                </div>
                            </li>
                            <li
                                class="flex gap-5 border-b border-brand-navy/10 p-7 sm:border-r sm:border-b-0 lg:border-r-0 lg:border-b"
                            >
                                <span
                                    class="font-display text-3xl text-brand-gold-dark"
                                    >02</span
                                >
                                <div>
                                    <h3 class="font-bold text-brand-navy">
                                        Send a message
                                    </h3>
                                    <p
                                        class="mt-1 text-sm leading-6 text-brand-muted"
                                    >
                                        The item and sample price are added for
                                        you.
                                    </p>
                                </div>
                            </li>
                            <li class="flex gap-5 p-7">
                                <span
                                    class="font-display text-3xl text-brand-gold-dark"
                                    >03</span
                                >
                                <div>
                                    <h3 class="font-bold text-brand-navy">
                                        Confirm your order
                                    </h3>
                                    <p
                                        class="mt-1 text-sm leading-6 text-brand-muted"
                                    >
                                        Agree on availability and delivery
                                        directly.
                                    </p>
                                </div>
                            </li>
                        </ol>
                    </div>
                </div>
            </section>

            <section class="bg-brand-cream-deep px-5 py-16 sm:px-8 lg:px-10">
                <div
                    class="mx-auto flex max-w-7xl flex-col items-center justify-between gap-8 text-center md:flex-row md:text-left"
                >
                    <div class="flex items-center gap-5">
                        <span
                            class="flex size-14 shrink-0 items-center justify-center rounded-full bg-brand-navy text-brand-gold"
                        >
                            <Music2 class="size-6" aria-hidden="true" />
                        </span>
                        <div>
                            <p
                                class="text-[0.65rem] font-bold tracking-[0.18em] text-brand-gold-dark uppercase"
                            >
                                Follow the style
                            </p>
                            <h2
                                class="mt-1 font-display text-3xl text-brand-navy"
                            >
                                See new looks on TikTok
                            </h2>
                        </div>
                    </div>
                    <a
                        :href="business.tiktokUrl"
                        target="_blank"
                        rel="noopener noreferrer"
                        class="inline-flex items-center gap-3 border-b border-brand-navy pb-1 text-xs font-bold tracking-[0.14em] text-brand-navy uppercase transition hover:text-brand-gold-dark focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold"
                    >
                        Visit TikTok
                        <ArrowRight class="size-4" aria-hidden="true" />
                    </a>
                </div>
            </section>
        </main>

        <footer
            class="bg-[#081A31] px-5 pt-16 pb-8 text-white sm:px-8 lg:px-10"
        >
            <div class="mx-auto max-w-7xl">
                <div
                    class="grid gap-12 border-b border-white/12 pb-14 md:grid-cols-2 lg:grid-cols-[1.3fr_0.7fr_0.7fr]"
                >
                    <div>
                        <img
                            src="/images/storefront/logo/jamy-fashions-logo.svg"
                            alt="Jamy Fashion's UG"
                            width="440"
                            height="156"
                            class="h-20 w-auto rounded-sm bg-brand-cream px-3"
                        />
                        <p
                            class="mt-6 max-w-sm text-sm leading-7 text-white/60"
                        >
                            Elegant, comfortable fashion chosen to help you show
                            up with style and confidence.
                        </p>
                    </div>
                    <div>
                        <h2
                            class="text-xs font-bold tracking-[0.18em] text-brand-gold uppercase"
                        >
                            Explore
                        </h2>
                        <nav
                            class="mt-5 flex flex-col items-start gap-3"
                            aria-label="Footer navigation"
                        >
                            <a
                                v-for="item in navigation.slice(1)"
                                :key="item.href"
                                :href="item.href"
                                class="text-sm text-white/68 transition hover:text-white"
                                >{{ item.label }}</a
                            >
                        </nav>
                    </div>
                    <div>
                        <h2
                            class="text-xs font-bold tracking-[0.18em] text-brand-gold uppercase"
                        >
                            Order & connect
                        </h2>
                        <div
                            class="mt-5 flex flex-col items-start gap-3 text-sm text-white/68"
                        >
                            <a
                                :href="generalWhatsappUrl"
                                target="_blank"
                                rel="noopener noreferrer"
                                class="transition hover:text-white"
                                >WhatsApp {{ business.phoneDisplay }}</a
                            >
                            <a
                                :href="business.tiktokUrl"
                                target="_blank"
                                rel="noopener noreferrer"
                                class="transition hover:text-white"
                                >TikTok</a
                            >
                        </div>
                    </div>
                </div>
                <div
                    class="flex flex-col justify-between gap-3 pt-7 text-[0.65rem] tracking-[0.12em] text-white/45 uppercase sm:flex-row"
                >
                    <p>
                        © {{ currentYear }} Jamy Fashion's UG. All rights
                        reserved.
                    </p>
                    <p>{{ business.tagline }}</p>
                </div>
            </div>
        </footer>

        <a
            :href="generalWhatsappUrl"
            target="_blank"
            rel="noopener noreferrer"
            aria-label="Chat with Jamy Fashion's UG on WhatsApp"
            class="fixed right-5 bottom-5 z-40 flex size-14 items-center justify-center rounded-full bg-[#1F9D55] text-white shadow-[0_12px_35px_rgba(13,39,77,0.25)] transition hover:-translate-y-1 hover:bg-[#178047] focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-brand-gold sm:right-7 sm:bottom-7"
        >
            <MessageCircle class="size-6" aria-hidden="true" />
        </a>
    </div>
</template>
