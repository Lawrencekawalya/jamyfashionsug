<?php

namespace App\Data;

use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

final readonly class StorefrontCatalog
{
    /**
     * @var list<array{
     *     id: string,
     *     name: string,
     *     category: 'Dresses'|'Hijabs',
     *     price: int,
     *     description: string,
     *     longDescription: string,
     *     image: string,
     *     imageAlt: string,
     *     gallery: list<string>,
     *     details: list<string>,
     *     colours: list<string>,
     *     badge?: string
     * }>
     */
    private const array PRODUCTS = [
        [
            'id' => 'sky-blue-everyday-abaya',
            'name' => 'Sky Blue Everyday Abaya',
            'category' => 'Dresses',
            'price' => 35000,
            'description' => 'A relaxed full-length silhouette for graceful everyday dressing.',
            'longDescription' => 'An easy modest layer designed to carry you comfortably through workdays, appointments and relaxed outings. The clean front and soft blue tone keep the look polished without feeling overdone.',
            'image' => '/images/storefront/products/sky-blue-abaya.webp',
            'imageAlt' => 'Woman wearing a full-length sky blue modest dress',
            'gallery' => [
                '/images/storefront/products/sky-blue-abaya.webp',
            ],
            'details' => ['Full-length modest silhouette', 'Front zip detail', 'Striped cuff finish'],
            'colours' => ['Sky blue'],
            'badge' => 'New',
        ],
        [
            'id' => 'sage-belted-abaya',
            'name' => 'Sage Belted Abaya',
            'category' => 'Dresses',
            'price' => 30000,
            'description' => 'A softly tailored sage dress finished with a flattering waist tie.',
            'longDescription' => 'A graceful full-length dress with a waist tie that lets you adjust the shape to your preference. Its calm sage colour makes it an effortless choice for understated everyday styling.',
            'image' => '/images/storefront/products/sage-belted-abaya.webp',
            'imageAlt' => 'Woman wearing a sage green belted modest dress',
            'gallery' => [
                '/images/storefront/products/sage-belted-abaya.webp',
            ],
            'details' => ['Adjustable waist tie', 'Full-length cut', 'Refined cuff detail'],
            'colours' => ['Sage green'],
        ],
        [
            'id' => 'navy-belted-abaya',
            'name' => 'Navy Belted Abaya',
            'category' => 'Dresses',
            'price' => 35000,
            'description' => 'A timeless navy layer with an easy belt and refined cuff detail.',
            'longDescription' => 'Classic navy gives this belted abaya an elegant, versatile finish. Wear it as a confident everyday look and adjust the waist tie for the silhouette that feels right for you.',
            'image' => '/images/storefront/products/navy-belted-abaya.webp',
            'imageAlt' => 'Woman modelling a navy blue belted abaya',
            'gallery' => [
                '/images/storefront/products/navy-belted-abaya.webp',
                '/images/storefront/products/navy-belted-abaya-back.webp',
            ],
            'details' => ['Front and back views', 'Adjustable waist tie', 'Striped cuff finish'],
            'colours' => ['Navy blue'],
            'badge' => 'Popular',
        ],
        [
            'id' => 'terracotta-tiered-dress',
            'name' => 'Terracotta Tiered Dress',
            'category' => 'Dresses',
            'price' => 30000,
            'description' => 'A flowing statement dress with soft tiers and a warm abstract print.',
            'longDescription' => 'A warm, expressive dress for days when you want your modest look to stand out. The tiered skirt brings movement while the long sleeves and flowing shape keep the finish easy and graceful.',
            'image' => '/images/storefront/products/terracotta-tiered-dress.webp',
            'imageAlt' => 'Woman wearing a terracotta and cream tiered modest dress',
            'gallery' => [
                '/images/storefront/products/terracotta-tiered-dress.webp',
                '/images/storefront/products/terracotta-tiered-dress-side.webp',
            ],
            'details' => ['Flowing tiered skirt', 'Long sleeves', 'Terracotta and cream print'],
            'colours' => ['Terracotta print'],
        ],
        [
            'id' => 'essential-chiffon-hijabs',
            'name' => 'Essential Chiffon Hijabs',
            'category' => 'Hijabs',
            'price' => 25000,
            'description' => 'Light, versatile chiffon in black and olive for effortless styling.',
            'longDescription' => 'Two timeless shades selected to work across your wardrobe. Choose classic black or earthy olive for an elegant drape that can take you from everyday dressing to special plans.',
            'image' => '/images/storefront/products/essential-chiffon-hijabs.webp',
            'imageAlt' => 'Black and olive Jamy Fashion chiffon hijabs',
            'gallery' => [
                '/images/storefront/products/essential-chiffon-hijabs.webp',
            ],
            'details' => ['Lightweight chiffon drape', 'Easy everyday styling', 'Two colour options shown'],
            'colours' => ['Black', 'Olive'],
            'badge' => '2 colours',
        ],
        [
            'id' => 'classic-chiffon-hijabs',
            'name' => 'Classic Chiffon Hijabs',
            'category' => 'Hijabs',
            'price' => 25000,
            'description' => 'Elegant everyday chiffon in rich mocha and signature navy.',
            'longDescription' => 'A refined pair of shades for effortless coordination. Mocha brings warmth to neutral looks while signature navy offers a rich, polished alternative for everyday wear.',
            'image' => '/images/storefront/products/classic-chiffon-hijabs.webp',
            'imageAlt' => 'Mocha and navy Jamy Fashion chiffon hijabs',
            'gallery' => [
                '/images/storefront/products/classic-chiffon-hijabs.webp',
            ],
            'details' => ['Lightweight chiffon drape', 'Easy everyday styling', 'Two colour options shown'],
            'colours' => ['Mocha', 'Navy blue'],
            'badge' => '2 colours',
        ],
    ];

    /**
     * @return list<array<string, mixed>>
     */
    public function all(): array
    {
        return self::PRODUCTS;
    }

    /**
     * @return array<string, mixed>
     */
    public function findOrFail(string $productId): array
    {
        foreach (self::PRODUCTS as $product) {
            if ($product['id'] === $productId) {
                return $product;
            }
        }

        throw new NotFoundHttpException;
    }

    /**
     * @param  array<string, mixed>  $selectedProduct
     * @return list<array<string, mixed>>
     */
    public function relatedTo(array $selectedProduct): array
    {
        return array_values(array_filter(
            self::PRODUCTS,
            fn (array $product): bool => $product['category'] === $selectedProduct['category']
                && $product['id'] !== $selectedProduct['id'],
        ));
    }
}
