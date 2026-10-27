import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_title.dart';
import '../../data/models/service_model.dart';
import '../../shared/widgets/check_item.dart';
import '../../shared/widgets/cta_banner.dart';
import '../../shared/widgets/hero_banner.dart';
import '../../shared/widgets/page_scaffold.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      children: [
        const HeroBanner(
          image: AppAssets.servicesHero,
          minHeight: 380,
          eyebrow: 'Our Services',
          title: 'Solutions for Every\nStage of Your Journey',
          body: 'From your first tax return to audits and growth planning, '
              'we offer complete financial, tax and compliance services '
              'under one roof.',
        ),
        SectionContainer(
          child: Column(
            children: [
              for (var i = 0; i < ServiceModel.all.length; i++) ...[
                if (i > 0)
                  SizedBox(
                    height: Responsive.value<double>(
                      context,
                      mobile: 56,
                      desktop: 80,
                    ),
                  ),
                _ServiceRow(
                  service: ServiceModel.all[i],
                  imageFirst: i.isEven,
                ),
              ],
            ],
          ),
        ),
        SectionContainer(
          background: AppColors.mint,
          child: Column(
            children: [
              const SectionTitle(
                eyebrow: 'Complete List',
                title: 'Everything We Offer',
                subtitle: 'Not sure which service you need? Here is the full '
                    'list, all under one roof.',
                centered: true,
              ),
              const SizedBox(height: 36),
              ResponsiveGrid(
                desktopColumns: 3,
                spacing: 14,
                runSpacing: 14,
                children: [
                  for (final name in ServiceModel.allOfferings)
                    _OfferItem(name),
                ],
              ),
              const SizedBox(height: 28),
              Text(
                'And more. If you need something that is not listed, just '
                'ask us.',
                style: AppText.body,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const CtaBanner(),
      ],
    );
  }
}

class _OfferItem extends StatelessWidget {
  const _OfferItem(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            size: 20,
            color: AppColors.primaryLight,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppText.body.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceRow extends StatelessWidget {
  const _ServiceRow({required this.service, required this.imageFirst});

  final ServiceModel service;
  final bool imageFirst;

  @override
  Widget build(BuildContext context) {
    final s = service;
    final desktop = Responsive.isDesktop(context);

    final image = SizedBox(
      height: Responsive.value<double>(context, mobile: 220, desktop: 320),
      child: AppImage(
        s.image,
        borderRadius: BorderRadius.circular(18),
        placeholderIcon: s.icon,
      ),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: s.color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(s.icon, color: AppColors.white, size: 24),
        ),
        const SizedBox(height: 16),
        Text(s.title, style: AppText.h3.copyWith(fontSize: 34)),
        const SizedBox(height: 10),
        Text(s.summary, style: AppText.body),
        const SizedBox(height: 20),
        for (final item in s.includes.take(3)) CheckItem(item),
        const SizedBox(height: 12),
        AppButton(
          label: 'View Details',
          variant: AppButtonVariant.outline,
          compact: true,
          showArrow: true,
          onPressed: () => context.go(AppRoutes.service(s.slug)),
        ),
      ],
    );

    if (!desktop) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [image, const SizedBox(height: 28), text],
      );
    }

    return Row(
      children: imageFirst
          ? [
              Expanded(child: image),
              const SizedBox(width: 64),
              Expanded(child: text),
            ]
          : [
              Expanded(child: text),
              const SizedBox(width: 64),
              Expanded(child: image),
            ],
    );
  }
}
