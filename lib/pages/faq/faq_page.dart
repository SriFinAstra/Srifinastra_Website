import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/section_container.dart';
import '../../data/faq_data.dart';
import '../../shared/widgets/faq_accordion.dart';
import '../../shared/widgets/hero_banner.dart';
import '../../shared/widgets/page_scaffold.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final categories = FaqData.categories;

    return PageScaffold(
      children: [
        const HeroBanner(
          minHeight: 340,
          eyebrow: 'FAQs',
          title: 'Frequently Asked\nQuestions',
          body: 'Straight answers to the questions people ask us most about '
              'income tax, GST, accounting, company registration and '
              'compliance.',
        ),
        SectionContainer(
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var i = 0; i < categories.length; i++)
                    _CategoryChip(
                      label: categories[i].label,
                      selected: i == _selected,
                      onTap: () => setState(() => _selected = i),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: SizedBox(
                  width: double.infinity,
                  child: FaqAccordion(
                    key: ValueKey(_selected),
                    items: categories[_selected].items,
                  ),
                ),
              ),
            ],
          ),
        ),
        const _NotSureCard(),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : AppColors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Text(
            label,
            style: AppText.small.copyWith(
              fontWeight: FontWeight.w600,
              color: selected ? AppColors.white : AppColors.textDark,
            ),
          ),
        ),
      ),
    );
  }
}

/// Closing card for people who are not sure which service they need.
class _NotSureCard extends StatelessWidget {
  const _NotSureCard();

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    return SectionContainer(
      topPadding: 0,
      bottomPadding: Responsive.value<double>(context, mobile: 48, desktop: 72),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(mobile ? 24 : 40),
        decoration: BoxDecoration(
          color: AppColors.mint,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          children: [
            Text(
              'Not sure which service you need?',
              textAlign: TextAlign.center,
              style: AppText.h3.copyWith(fontSize: mobile ? 26 : 32),
            ),
            const SizedBox(height: 12),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 680),
              child: Text(
                'You do not need to understand every tax, accounting or '
                'financial term before contacting us. Tell us about your '
                'requirement, whether you are an individual filing an Income '
                'Tax Return, an entrepreneur starting a business, or an '
                'established business looking for GST, accounting, '
                'compliance or financial reporting support, and we will help '
                'you understand the right next step.',
                textAlign: TextAlign.center,
                style: AppText.body,
              ),
            ),
            const SizedBox(height: 24),
            AppButton(
              label: 'Talk to Us',
              showArrow: true,
              onPressed: () => context.go(AppRoutes.contact),
            ),
          ],
        ),
      ),
    );
  }
}
