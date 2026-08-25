<?php

namespace App\Http\Controllers;

use App\Data\StorefrontCatalog;
use Inertia\Inertia;
use Inertia\Response;

final class StorefrontController extends Controller
{
    public function __construct(private StorefrontCatalog $catalog) {}

    public function index(): Response
    {
        return Inertia::render('Welcome', [
            'products' => $this->catalog->all(),
        ]);
    }

    public function show(string $product): Response
    {
        $selectedProduct = $this->catalog->findOrFail($product);

        return Inertia::render('Products/Show', [
            'product' => $selectedProduct,
            'relatedProducts' => $this->catalog->relatedTo($selectedProduct),
        ]);
    }
}
