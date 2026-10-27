# Sri Fin Astra — Website

Static website for **Sri Fin Astra**, a Chartered Accountancy firm in Hyderabad.
Built with Flutter web.

## Pages

| Route | Page |
|---|---|
| `/` | Home — hero, services, why choose us, stats, testimonial |
| `/about` | About — hero, our story, values, services, CTA |
| `/services` | All services, one row each |
| `/services/<slug>` | Service details (`tax-services`, `accounting-services`, `audit-assurance`, `business-advisory`) |
| `/contact` | Contact details + enquiry form (opens the visitor's email app) |

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

If Flutter complains about missing web files, run this once — it only adds
what's missing and won't touch `lib/`:

```bash
flutter create . --platforms web
```

## Build & deploy

```bash
flutter build web --release
```

Output is in `build/web/`. The site uses clean URLs (`/about`, not `/#/about`),
so the host must send every path to `index.html`. `firebase.json` in this
repo already does that for Firebase Hosting:

```bash
firebase deploy --only hosting
```

## Where to change things

| What | File |
|---|---|
| Colours | `lib/core/constants/app_colors.dart` |
| Fonts & text styles | `lib/core/constants/app_text.dart` (`AppText`) |
| Phone, email, address, social links | `lib/core/constants/app_text.dart` (`AppInfo`) |
| Services content | `lib/data/models/service_model.dart` |
| Stats (10+, 500+ …) | `lib/data/models/stat_model.dart` |
| Image paths | `lib/core/constants/app_assets.dart` |
| Breakpoints | `lib/core/responsive/breakpoints.dart` |
| SEO title / description | `web/index.html` |

Search the code for `TODO` to find every placeholder that needs real client content.

## Images

Drop images into `assets/images/...` using the file names in `app_assets.dart`.
Until a file exists, a soft cream/mint placeholder is shown, so the layout
never breaks. Hero photos look best around **1920×900**, with the subject on
the right (the left side fades into cream behind the text).

The logo is currently drawn in code (`shared/widgets/brand_logo.dart`).
Swap it for `Image.asset(AppAssets.logo)` when the real file is ready.

## Structure

```
lib/
├── main.dart
├── app/            app.dart, router.dart (go_router), theme.dart
├── core/
│   ├── constants/  colors, text styles + firm info, asset paths
│   ├── responsive/ breakpoints + Responsive helpers
│   ├── utils/      link_launcher (tel:, mailto:, links)
│   └── widgets/    section_container, responsive_layout (+ ResponsiveGrid),
│                   app_button, section_title, app_image, leaf
├── data/models/    service_model, stat_model
├── pages/          home, about, services, contact
└── shared/
    ├── navbar/     navbar + mobile drawer
    ├── footer/
    └── widgets/    page_scaffold, hero_banner, cta_banner, brand_logo,
                    service_card, stat_card, value_card, check_item
```
