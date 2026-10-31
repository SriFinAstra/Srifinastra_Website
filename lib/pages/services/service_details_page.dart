import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/utils/link_launcher.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/responsive_layout.dart';
import '../../core/widgets/section_container.dart';
import '../../core/widgets/section_title.dart';
import '../../data/models/service_model.dart';
import '../../shared/widgets/check_item.dart';
import '../../shared/widgets/hero_banner.dart';
import '../../shared/widgets/page_scaffold.dart';
import '../../shared/widgets/service_card.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final service = ServiceModel.bySlug(slug);

    if (service == null) {
      return PageScaffold(
        children: [
          HeroBanner(
            minHeight: 420,
            eyebrow: 'Our Services',
            title: 'Service not found',
            body: "We couldn't find that page. Have a look at everything we "
                'offer instead.',
            action: AppButton(
              label: 'View All Services',
              showArrow: true,
              onPressed: () => context.go(AppRoutes.services),
            ),
          ),
        ],
      );
    }

    final s = service;
    final desktop = Responsive.isDesktop(context);
    final others = ServiceModel.all.where((o) => o.slug != s.slug).toList();

    final main = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Responsive.value<double>(context, mobile: 220, desktop: 340),
          child: AppImage(
            s.image,
            borderRadius: BorderRadius.circular(18),
            placeholderIcon: s.icon,
          ),
        ),
        const SizedBox(height: 36),
        Text('Overview', style: AppText.h3),
        const SizedBox(height: 10),
        Text(s.description, style: AppText.body),
        const SizedBox(height: 32),
        Text("What's Included", style: AppText.h3),
        const SizedBox(height: 16),
        for (final item in s.includes) CheckItem(item),
      ],
    );

    final help = _HelpCard(serviceTitle: s.title);

    return PageScaffold(
      children: [
        HeroBanner(
          minHeight: 380,
          eyebrow: s.headline ?? 'Our Services',
          title: s.title,
          body: s.summary,
          action: TextButton.icon(
            onPressed: () => context.go(AppRoutes.services),
            icon: const Icon(Icons.arrow_back_rounded, size: 18),
            label: const Text('All services'),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
              textStyle: AppText.button,
              padding: EdgeInsets.zero,
            ),
          ),
        ),
        SectionContainer(
          child: desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 7, child: main),
                    const SizedBox(width: 48),
                    Expanded(flex: 4, child: help),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [main, const SizedBox(height: 40), help],
                ),
        ),
        for (var i = 0; i < s.sections.length; i++)
          _PointsSection(
            section: s.sections[i],
            color: s.color,
            background: i.isEven ? AppColors.mint : AppColors.background,
          ),
        SectionContainer(
          background: AppColors.backgroundAlt,
          child: Column(
            children: [
              const SectionTitle(eyebrow: 'Other Services', centered: true),
              const SizedBox(height: 32),
              ResponsiveGrid(
                desktopColumns: 5,
                children: [for (final o in others) ServiceCard(service: o)],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// A band of icon cards (e.g. "Why file your ITR", "Who can we file for").
class _PointsSection extends StatelessWidget {
  const _PointsSection({
    required this.section,
    required this.color,
    required this.background,
  });

  final ServiceSection section;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      background: background,
      child: Column(
        children: [
          SectionTitle(
            eyebrow: section.eyebrow,
            title: section.title,
            subtitle: section.subtitle,
            centered: true,
          ),
          const SizedBox(height: 36),
          ResponsiveGrid(
            desktopColumns: 3,
            children: [
              for (final p in section.points) _PointCard(point: p, color: color),
            ],
          ),
        ],
      ),
    );
  }
}

class _PointCard extends StatelessWidget {
  const _PointCard({required this.point, required this.color});

  final ServicePoint point;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(point.icon, color: AppColors.white, size: 24),
          ),
          const SizedBox(height: 16),
          Text(point.title, style: AppText.title),
          const SizedBox(height: 8),
          Text(point.text, style: AppText.small.copyWith(fontSize: 14.5)),
        ],
      ),
    );
  }
}

class _HelpCard extends StatelessWidget {
  const _HelpCard({required this.serviceTitle});

  final String serviceTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.mint,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Need help with $serviceTitle?', style: AppText.h3),
          const SizedBox(height: 10),
          Text(
            'Talk to us for a personalised consultation. We usually reply '
            'within one working day.',
            style: AppText.small.copyWith(fontSize: 14.5),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              label: 'Contact Us',
              showArrow: true,
              onPressed: () => context.go(AppRoutes.contact),
            ),
          ),
          const SizedBox(height: 20),
          _ContactLine(
            icon: Icons.phone_outlined,
            text: AppInfo.phone,
            onTap: () => LinkLauncher.call(AppInfo.phoneRaw),
          ),
          _ContactLine(
            icon: Icons.mail_outline_rounded,
            text: AppInfo.email,
            onTap: () => LinkLauncher.email(
              AppInfo.email,
              subject: 'Enquiry: $serviceTitle',
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                text,
                style: AppText.small.copyWith(
                  fontSize: 14.5,
                  color: AppColors.textDark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
