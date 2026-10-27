import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_image.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';

class WhyChooseUs extends StatelessWidget {
  const WhyChooseUs({super.key});

  static const _features = [
    (
      icon: Icons.workspace_premium_outlined,
      title: 'Expertise & Experience',
      text: 'Decades of domain knowledge',
    ),
    (
      icon: Icons.person_pin_outlined,
      title: 'Personalised Approach',
      text: 'Solutions for your unique needs',
    ),
    (
      icon: Icons.verified_outlined,
      title: 'Timely & Reliable',
      text: 'Accuracy you can count on',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.isDesktop(context);

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionTitle(
          eyebrow: 'Why Choose Us',
          title: 'More Than Just Numbers',
          subtitle: 'We combine technical expertise with a personal touch to '
              'help you make informed decisions, stay compliant and achieve '
              'sustainable growth.',
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 28,
          runSpacing: 20,
          children: [
            for (final f in _features)
              SizedBox(
                width: 200,
                child: _Feature(icon: f.icon, title: f.title, text: f.text),
              ),
          ],
        ),
        const SizedBox(height: 36),
        AppButton(
          label: 'Know More',
          variant: AppButtonVariant.outline,
          compact: true,
          onPressed: () => context.go(AppRoutes.about),
        ),
      ],
    );

    final image = SizedBox(
      height: Responsive.value<double>(context, mobile: 280, desktop: 440),
      child: AppImage(
        AppAssets.office,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(160),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        placeholderChild: Transform.rotate(
          angle: -0.18,
          child: Text(
            'Plan\n   Analyse\n      Grow',
            style: AppText.script.copyWith(fontSize: 40),
          ),
        ),
      ),
    );

    return SectionContainer(
      background: AppColors.backgroundAlt,
      child: desktop
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 5, child: text),
                const SizedBox(width: 56),
                Expanded(flex: 5, child: image),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [text, const SizedBox(height: 40), image],
            ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature({required this.icon, required this.title, required this.text});

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primary, width: 1.2),
          ),
          child: Icon(icon, size: 20, color: AppColors.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppText.title.copyWith(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(text, style: AppText.small.copyWith(fontSize: 12.5)),
            ],
          ),
        ),
      ],
    );
  }
}
