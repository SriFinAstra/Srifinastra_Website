import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/section_container.dart';
import '../../../core/widgets/section_title.dart';
import '../../../data/faq_data.dart';
import '../../../shared/widgets/faq_accordion.dart';

/// A few popular questions on the Home page, linking to the full FAQ page.
class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      background: AppColors.backgroundAlt,
      child: Column(
        children: [
          const SectionTitle(
            eyebrow: 'FAQs',
            title: 'Frequently Asked Questions',
            subtitle: 'Quick answers to what people ask us most.',
            centered: true,
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: SizedBox(
              width: double.infinity,
              child: FaqAccordion(items: FaqData.popular),
            ),
          ),
          const SizedBox(height: 28),
          AppButton(
            label: 'View All FAQs',
            showArrow: true,
            onPressed: () => context.go(AppRoutes.faq),
          ),
        ],
      ),
    );
  }
}
