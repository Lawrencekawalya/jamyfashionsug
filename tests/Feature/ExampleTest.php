<?php

use Inertia\Testing\AssertableInertia as Assert;

test('storefront homepage is rendered', function () {
    $response = $this->get(route('home'));

    $response
        ->assertOk()
        ->assertInertia(fn (Assert $page) => $page
            ->component('Welcome')
            ->has('products', 6)
            ->where('products.0.id', 'sky-blue-everyday-abaya')
            ->where('products.0.price', 35000),
        );
});

test('product detail page is rendered from its catalogue slug', function () {
    $response = $this->get(route('products.show', 'sky-blue-everyday-abaya'));

    $response
        ->assertOk()
        ->assertInertia(fn (Assert $page) => $page
            ->component('Products/Show')
            ->where('product.id', 'sky-blue-everyday-abaya')
            ->where('product.name', 'Sky Blue Everyday Abaya')
            ->where('product.price', 35000)
            ->has('product.gallery', 1)
            ->has('relatedProducts', 3),
        );
});

test('unknown product slug returns not found', function () {
    $this->get(route('products.show', 'unknown-product'))
        ->assertNotFound();
});
