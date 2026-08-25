# Jamy Fashion's UG Homepage Implementation Plan

## 1. Project Goal

Build a polished, mobile-first homepage concept that presents Jamy Fashion's UG as a professional online shop for ladies' Muslim casual dresses, hijabs, and complementary fashion items.

The first delivery is intentionally a focused sales demo, not a complete e-commerce platform. Its job is to help the client picture the finished brand experience, browse a curated sample collection, and start an order through WhatsApp.

### Primary outcome

A visitor should be able to:

1. Understand the brand and product offering within a few seconds.
2. Browse dresses and hijabs in a visually organised way.
3. See sample product names, prices, and short descriptions.
4. Start a WhatsApp order with the relevant product already included in the message.
5. Find the brand story, contact details, and TikTok/social links.

### Confirmed brand name

Use **Jamy Fashion's UG**, matching the supplied logo. The supporting brand line is **“Style. Confidence. You.”**

## 2. Scope

### Included in the sample

- One premium, responsive homepage.
- Branded navigation and mobile menu.
- Hero section using the client's strongest product/lifestyle photo.
- Shop-by-category cards for Casual Dresses and Hijabs.
- A compact “Also available” treatment for accessories, bags and footwear, and custom outfits.
- Featured products or new arrivals with photos, prices, and descriptions.
- Brand value/story section: “Why Jamy Fashion's UG”.
- WhatsApp ordering call to action.
- TikTok/social section or social callout.
- Contact information and footer.
- Product-specific WhatsApp links with prefilled messages.
- Responsive layouts for mobile, tablet, and desktop.
- Basic SEO, accessibility, performance, and social-sharing metadata.

### Explicitly deferred

- Customer accounts, registration, or login.
- Shopping cart and online checkout.
- Mobile Money or card payment integration.
- Stock tracking and order management.
- Product search, filtering, and pagination.
- Full product detail pages.
- Admin dashboard or client product uploader.
- Delivery-rate automation.
- A complete multi-page website.

These can be proposed as Phase 2 only after the client approves the concept, project scope, price, and deposit.

## 3. Confirmed Materials and Remaining Content

### Confirmed for the concept

- Square JPEG logo reference at `docs/provided-materials/jamyfassions-logo.jpeg`.
- Brand flyer and founder/brand portrait at `docs/provided-materials/WhatsApp Image 2026-08-25 at 12.48.46 PM.jpeg`.
- Six dress photographs covering approximately four distinct looks.
- Two high-resolution hijab compositions showing black, olive, brown, and navy options.
- WhatsApp number: `+256 701 419 722`.
- Temporary TikTok destination: `https://www.tiktok.com/`.
- Sample prices may rotate between `UGX 25,000`, `UGX 30,000`, and `UGX 35,000`.
- The business may mention ready-to-wear pieces, hijabs and accessories, bags and footwear, and custom outfits.
- Brand-story direction from the supplied flyer.

### Still to confirm before production launch

- The official TikTok business profile URL.
- Real product names, exact product-to-price mapping, sizes, colours, fabrics, and current availability.
- Delivery areas, pickup details, operating hours, and ordering expectations.
- Preferred contact details and any approved customer testimonials.
- Whether all service categories are currently available or should be worded as “available on request”.

The concept will use elegant descriptive sample names and the approved rotating prices. These remain demonstration content and must be replaced or confirmed before public launch.

## 4. Brand and Visual Direction

### Creative concept

The interface should feel modest, elegant, warm, feminine, and trustworthy without becoming overly decorative. Product photography should remain the main visual focus.

### Proposed palette

- Deep navy: `#0D1B2A` — navigation, strong headings, footer, and primary contrast.
- Warm gold: `#C6A15B` — highlights, fine borders, badges, and selected accents.
- Soft cream: `#F7F2E8` — page backgrounds and quiet content sections.
- Warm white: `#FFFCF7` — product cards and clean breathing space.
- Charcoal: `#252525` — readable body copy.

These are starting tokens and must be adjusted to harmonise with the actual logo.

### Typography

- Use an elegant editorial serif for large campaign headings.
- Use a clean sans-serif for navigation, prices, descriptions, and buttons.
- Keep the number of font families and weights small for performance and consistency.

### Art direction

- Use tall fashion-oriented image ratios, especially `4:5`, for product cards.
- Preserve natural skin tones and garment colours; avoid heavy filters.
- Use generous spacing, restrained gold accents, soft borders, and subtle shadows.
- Avoid a generic template appearance, excessive gradients, glass effects, or distracting animation.
- Use motion only as light polish, with reduced-motion preferences respected.

## 5. Homepage Information Architecture

### 5.1 Announcement bar

A slim message above the navigation for a useful sales detail such as delivery availability, new arrivals, or WhatsApp ordering.

### 5.2 Navigation

- Logo/brand at the left.
- Links to Home, Dresses, Hijabs, New Arrivals, and Our Story.
- Primary “Order on WhatsApp” action.
- Compact accessible menu on mobile.
- Section links may scroll within the homepage for the sample.

### 5.3 Hero section

- Campaign line: **“Modest Style. Effortless Confidence.”**
- Short supporting copy explaining the casual dresses and hijabs offering.
- Primary action: **Shop Collection**.
- Secondary action: **Order on WhatsApp**.
- One strong client image, carefully cropped for small and large screens.
- Optional small trust cue such as “Easy ordering via WhatsApp”.

### 5.4 Shop by category

Two strong image-led cards:

- Casual Dresses.
- Hijabs.

Each card should include a short description and lead the visitor to the matching product group on the page.

A smaller supporting row can mention accessories, bags and footwear, and custom outfits without presenting an unsupported product catalogue for those categories.

### 5.5 Featured products / new arrivals

A curated grid of approximately 6 sample products. The dress grid will treat alternate angles as one product rather than inflating the catalogue. Hijab colours can provide the remaining featured items. Each card should show:

- Product photograph.
- Product name.
- Category or “New” badge where relevant.
- Price formatted in UGX.
- Short useful detail, such as fabric, available sizes, or colour.
- “Order on WhatsApp” action that includes the product name in the prefilled message.

For the sample, these products will be maintained as typed local content so the concept can be completed quickly. Product records in the database are deferred until a real catalogue is commissioned.

### 5.5.1 Sample product working set

| Working product | Source image(s) | Sample price |
| --- | --- | ---: |
| Sky Blue Everyday Abaya | `product11.jpeg` | UGX 35,000 |
| Sage Belted Abaya | `product12.jpeg` | UGX 30,000 |
| Navy Belted Abaya | `product13.jpeg`, `product14.jpeg` | UGX 35,000 |
| Terracotta Tiered Dress | `product15.jpeg`, `product16.jpeg` | UGX 30,000 |
| Essential Chiffon Hijab | `hijab2.png` | UGX 25,000 |
| Classic Chiffon Hijab | `hijabs1.png` | UGX 25,000 |

These names and mappings are presentation copy, not confirmed inventory facts.

### 5.6 Why Jamy Fashion's UG

A short brand/value section with three credible promises, for example:

- Modest styles selected for everyday confidence.
- Comfortable pieces for work, outings, and relaxed occasions.
- Simple, personal ordering and support through WhatsApp.

Claims such as delivery speed, fabric quality, or nationwide delivery must only be shown after the client confirms them.

### 5.7 WhatsApp ordering call to action

A high-contrast branded section explaining the simple ordering flow:

1. Choose an item.
2. Send its details through WhatsApp.
3. Confirm size, colour, delivery, and payment directly with the business.

The main WhatsApp button should open `https://wa.me/256701419722` in a new tab and use a properly encoded prefilled message.

### 5.8 TikTok / social section

Use a compact section that encourages visitors to follow new looks and arrivals on TikTok. Do not embed a heavy social feed in the sample; use selected imagery and an external profile link for better reliability and speed. Until the official profile is supplied, link to the TikTok homepage and do not imply it is the brand's account.

### 5.9 Footer

- Logo and short brand statement.
- Quick section links.
- WhatsApp/contact details.
- TikTok and other confirmed social profiles.
- Location or delivery area if confirmed.
- Copyright line.

## 6. Responsive Behaviour

The design will be mobile-first because most customers are likely to arrive from WhatsApp, TikTok, or other social apps.

- Mobile: one-column hero, swipe-friendly spacing, two-column product grid where practical, and clear tap targets.
- Tablet: balanced two-column sections and a 2–3 column product grid.
- Desktop: editorial split hero, wider content container, and 3–4 column product grid.
- Navigation, images, headings, and buttons must be tested at narrow and wide intermediate widths, not only preset device sizes.
- The WhatsApp action must remain easy to find without obstructing content.

## 7. Technical Approach

### Confirmed stack

- PHP 8.5.
- Laravel 13.27.
- Inertia Laravel 3.3.
- Vue 3.5 with TypeScript.
- Inertia Vue 3.7.
- Tailwind CSS 4.1.
- Vite 8.
- Laravel Wayfinder for typed internal route references.
- Lucide Vue for interface icons already available in the project.
- Pest 5 for automated tests.

No new dependency is needed for the homepage concept.

### Proposed file organisation

```text
resources/js/pages/Welcome.vue
resources/js/components/storefront/
    StorefrontHeader.vue
    HeroSection.vue
    CategoryCard.vue
    ProductCard.vue
    BrandStorySection.vue
    WhatsAppCta.vue
    SocialSection.vue
    StorefrontFooter.vue
resources/js/data/storefront.ts
resources/js/types/storefront.ts
resources/css/app.css
public/images/storefront/
    logo/
    hero/
    categories/
    products/
```

This uses the existing `home` route and Inertia page instead of introducing unnecessary routes or backend layers for the sample.

### Content strategy for the sample

- Store curated category and product content in a typed TypeScript module.
- Keep the WhatsApp number, social links, and other business settings in one clearly identified configuration object.
- Render reusable Vue components from that data so changing products does not require duplicating markup.
- Use Wayfinder-generated functions for internal Laravel links if additional routes are introduced later.
- Use normal external links for WhatsApp and TikTok.

### Image handling

- Keep untouched originals outside the web-served folder during preparation.
- Crop consistent display variants without changing garment colours.
- Export photographs as WebP or AVIF with an appropriate JPEG fallback only when needed.
- Give every image meaningful alternative text.
- Set width/height or aspect ratio to prevent layout movement.
- Eager-load only the main hero image; lazy-load below-the-fold product imagery.
- Avoid upscaling small WhatsApp-compressed photos beyond a credible display size.

### Supplied asset mapping

- Hero: `product11.jpeg` in a contained editorial image panel rather than a full-bleed crop.
- Dresses category: `product15.jpeg`.
- Hijabs category: use a balanced crop from `hijab2.png` or `hijabs1.png`.
- Brand story: use copy and brand direction from the flyer; do not render the full flyer as page content.
- Featured products: use the working set above and keep alternate dress angles attached to the same item.
- The two hijab PNGs are large enough for responsive crops but should be converted to optimised WebP/AVIF derivatives for delivery.

### Logo preparation

- Preserve the supplied JPEG as the visual source of truth.
- Reconstruct a clean, scalable SVG version for the website because no transparent master is available.
- Prepare a full lockup for larger placements and a simplified monogram for compact navigation/favicon use.
- Compare shape, wording, spacing, navy, and gold treatment against the original at multiple sizes before approval.
- Keep the source JPEG available until the client has approved the reconstructed SVG; do not silently replace the identity with an approximate mark.

### WhatsApp ordering links

Use the standard WhatsApp URL format with an encoded message. A product action should produce wording similar to:

> Hello Jamy Fashion's UG, I am interested in the [Product Name] priced at UGX [Price]. Is it available in my size/colour?

Use the confirmed number `256701419722` in URL-safe international format. The final wording should be tested on mobile and desktop before the client demo is shared publicly. No customer information will be collected by the website in this phase.

## 8. Implementation Phases

### Phase 0 — Content audit and direction

- Use the confirmed brand name and inspect the logo at navigation and display sizes.
- Review every supplied product photo for resolution, orientation, and suitability.
- Match product information to the correct image.
- Use the confirmed WhatsApp number and mark TikTok as a temporary destination.
- Use the selected hero image and six-item sample working set.
- Finalise the palette and type direction from the real assets.

**Exit condition:** all displayed content is traceable to an approved client asset or clearly marked placeholder.

### Phase 1 — Design foundation

- Add storefront design tokens to the Tailwind 4 CSS-first theme.
- Establish content width, spacing rhythm, typography, buttons, badges, image ratios, and focus styles.
- Reconstruct, review, and export the SVG logo variants; prepare and optimise product assets.
- Define typed category, product, and business-link data.

**Exit condition:** the visual system and content model are ready for consistent component work.

### Phase 2 — Homepage build

- Replace the Laravel starter welcome page with the storefront experience.
- Build the navigation, hero, category, product, brand story, CTA, social, and footer components.
- Add product-specific WhatsApp actions.
- Use semantic section IDs for same-page navigation.
- Complete responsive states from mobile through desktop.

**Exit condition:** the complete approved homepage flow works with real client content.

### Phase 3 — Polish and quality assurance

- Add page title, description, favicon/logo treatment, and social-sharing metadata.
- Check keyboard navigation, focus visibility, heading order, labels, colour contrast, and alternative text.
- Check image loading, layout stability, and reduced-motion behaviour.
- Verify all phone, WhatsApp, social, and section links.
- Review visual consistency across current Chrome, Safari, Firefox, and common mobile widths.
- Run automated project tests, linting, formatting, type checks, and production build.

**Exit condition:** there are no broken calls to action, blocking accessibility issues, console errors, type errors, or production build errors.

### Phase 4 — Client presentation and revision

- Present the homepage on a shareable preview URL.
- Explain that the demo proves the design direction and customer journey.
- Collect one consolidated round of feedback on visuals, copy, and product selection.
- Make the agreed concept revisions.
- Discuss the deposit and scope for launch or the larger Phase 2 catalogue.

**Exit condition:** the client approves the direction or requests a clearly scoped next iteration.

## 9. Testing and Verification

Every code change will receive proportionate automated coverage and verification.

### Automated checks

- Pest feature test confirms the homepage route responds successfully and renders the expected Inertia page.
- Where WhatsApp link generation is extracted into application logic, test correct phone and message encoding, including product-specific content.
- Run the affected test after each related change.
- Run frontend type checking and lint checks.
- Run the production Vite build.
- If PHP files change, run Laravel Pint using the project's agent format.

### Manual checks

- Validate layout at approximately 320 px, 375 px, 768 px, 1024 px, and a wide desktop viewport.
- Test keyboard-only navigation and visible focus states.
- Confirm menu behaviour and skip/section navigation.
- Open every WhatsApp button on mobile and desktop.
- Confirm each product button references the correct item and price.
- Check that TikTok and other social links open the correct official profile.
- Test with slow-network throttling to ensure images do not cause a broken first impression.
- Check the browser console and recent browser logs for errors.

### Final project commands

```bash
php artisan test --compact <affected-test-file>
npm run types:check
npm run lint:check
npm run format:check
npm run build
vendor/bin/pint --dirty --format agent
```

Only the commands relevant to changed file types need to run. After focused tests pass, the complete test suite should be run before production launch.

## 10. Acceptance Criteria

The sample is ready to present when:

- The homepage no longer resembles the default Laravel starter screen.
- The client logo, palette, and supplied product imagery create a coherent branded experience.
- The headline, category structure, and product grid make the offering clear immediately.
- Six sample items show correct image-to-product matching, approved demonstration prices, and useful descriptions.
- Every primary order action opens the confirmed WhatsApp number with relevant prefilled context.
- The page is polished and usable on phone, tablet, and desktop.
- Navigation is accessible by touch and keyboard.
- Images are optimised and do not create obvious layout shifts.
- No unconfirmed business claim or fabricated testimonial appears.
- Automated checks and the production build pass.
- Deferred features are not accidentally presented as working functionality.

## 11. Risks and Controls

- **Low-resolution WhatsApp images:** use careful crops, conservative display sizes, and request originals where necessary.
- **Missing product details:** keep content visibly marked as sample rather than inventing facts.
- **Scope expansion:** keep the demo to one homepage and list all additional features as separately priced future work.
- **Incorrect WhatsApp destination:** use the confirmed `256701419722` destination and test it on mobile and desktop.
- **Out-of-stock sample items:** confirm availability immediately before presenting or launching the page.
- **Generic visual result:** derive palette, image treatment, and typography from the actual logo and strongest product photography.
- **Slow page on mobile data:** limit font weights, optimise images, avoid embedded social feeds, and defer non-critical media.

## 12. Future Phase After Approval

If the client wants a complete digital shop, scope it separately. Possible additions include:

- Product and category database models.
- Individual product pages with variants and availability.
- Search and filters.
- Client-managed admin dashboard.
- Shopping cart and checkout.
- Mobile Money/payment gateway integration.
- Delivery pricing and order-status workflow.
- Customer accounts only if they add real value to the buying experience.
- Analytics, conversion tracking, and richer SEO content.

Before this expansion, define the catalogue size, order workflow, who maintains stock, payment provider, delivery rules, hosting, support, schedule, and budget.

## 13. Immediate Next Action

The supplied assets are now sufficient for the homepage concept. Begin by reconstructing and visually verifying the SVG logo, preparing responsive image derivatives, and defining the typed six-item sample product set. The remaining production-only facts can be confirmed after the client reviews the concept.
