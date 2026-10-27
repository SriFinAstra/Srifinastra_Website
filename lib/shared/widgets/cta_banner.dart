import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/responsive.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/leaf.dart';
import '../../core/widgets/section_container.dart';

/// "Let's Discuss Your Financial Goals" banner shown above the footer.
class CtaBanner extends StatelessWidget {
  const CtaBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    final text = Column(
      crossAxisAlignment:
          mobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Let's Discuss Your Financial Goals",
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: AppText.h3.copyWith(
            color: AppColors.white,
            fontSize: mobile ? 28 : 32,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Get in touch with us for a personalised consultation.',
          textAlign: mobile ? TextAlign.center : TextAlign.start,
          style: AppText.body.copyWith(color: AppColors.textLight),
        ),
      ],
    );

    final button = AppButton(
      label: 'Contact Us',
      variant: AppButtonVariant.light,
      showArrow: true,
      compact: true,
      onPressed: () => context.go(AppRoutes.contact),
    );

    return SectionContainer(
      topPadding: 0,
      bottomPadding: Responsive.value<double>(context, mobile: 48, desktop: 72),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [AppColors.primaryDark, AppColors.primary],
            ),
          ),
          child: Stack(
            children: [
              const Positioned(
                left: -14,
                bottom: -30,
                child: Leaf(width: 60, height: 150, opacity: 0.35, angle: 0.6),
              ),
              const Positioned(
                right: 20,
                top: -40,
                child: Leaf(width: 50, height: 130, opacity: 0.2, angle: 2.8),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mobile ? 24 : 56,
                  vertical: mobile ? 40 : 44,
                ),
                child: mobile
                    ? Column(
                        children: [text, const SizedBox(height: 24), button],
                      )
                    : Row(
                        children: [
                          Expanded(child: text),
                          const SizedBox(width: 24),
                          button,
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
