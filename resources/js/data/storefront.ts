import type { Product, StorefrontLink } from '@/types/storefront';

export const business = {
    name: "Jamy Fashion's UG",
    tagline: 'Style. Confidence. You.',
    phoneDisplay: '+256 701 419 722',
    phoneInternational: '256701419722',
    tiktokUrl: 'https://www.tiktok.com/',
} as const;

export const navigation: StorefrontLink[] = [
    { label: 'Home', href: '#home' },
    { label: 'Dresses', href: '#dresses' },
    { label: 'Hijabs', href: '#hijabs' },
    { label: 'New arrivals', href: '#new-arrivals' },
    { label: 'Our story', href: '#our-story' },
];

export function whatsappUrl(message: string): string {
    return `https://wa.me/${business.phoneInternational}?text=${encodeURIComponent(message)}`;
}

export function productWhatsappUrl(
    product: Product,
    productUrl: string,
): string {
    const price = new Intl.NumberFormat('en-US').format(product.price);

    return whatsappUrl(
        `Hello ${business.name}, I am interested in the ${product.name} priced at UGX ${price}. Is it available in my size/colour?\n\nView product: ${productUrl}`,
    );
}
