export type ProductCategory = 'Dresses' | 'Hijabs';

export type Product = {
    id: string;
    name: string;
    category: ProductCategory;
    price: number;
    description: string;
    longDescription: string;
    image: string;
    imageAlt: string;
    gallery: string[];
    details: string[];
    colours: string[];
    badge?: string;
};

export type StorefrontLink = {
    label: string;
    href: string;
};
