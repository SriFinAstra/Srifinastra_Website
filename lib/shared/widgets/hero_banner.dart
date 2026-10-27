import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/responsive/breakpoints.dart';
import '../../core/responsive/responsive.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/leaf.dart';

/// Page hero: photo on the right fading into cream on the left, with
/// eyebrow, serif headline, text and an optional button.
/// Without [image] it shows a soft mint/cream gradient (used for the
/// smaller Services / Contact headers).
class HeroBanner extends StatelessWidget {
  const HeroBanner({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.body,
    this.image,
    this.action,
    this.minHeight = 540,
    this.titleSize,
  });

  final String eyebrow;
  final String title;
  final String body;
  final String? image;
  final Widget? action;
  final double minHeight;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    const bg = AppColors.background;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: mobile ? 0 : minHeight),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background photo or soft gradient.
          Positioned.fill(
            child: image != null
                ? AppImage(
                    image!,
                    alignment: Alignment.centerRight,
                    // Plain soft gradient until the real photo is added.
                    placeholderChild: const SizedBox.shrink(),
                  )
                : const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFFBF8F2),
                          Color(0xFFEFF4EF),
                          Color(0xFFE2EEE9),
                        ],
                      ),
                    ),
                  ),
          ),
          // Cream fade so the text always stays readable.
          if (image != null)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      bg,
                      bg.withAlpha(mobile ? 230 : 240),
                      bg.withAlpha(mobile ? 170 : 0),
                    ],
                    stops: mobile
                        ? const [0.0, 0.6, 1.0]
                        : const [0.0, 0.42, 0.72],
                  ),
                ),
              ),
            ),
          // Decorative leaves.
          const Positioned(
            left: -22,
            bottom: 24,
            child: Leaf(
              width: 46,
              height: 120,
              color: AppColors.accent,
              opacity: 0.45,
              angle: 0.7,
            ),
          ),
          const Positioned(
            left: -30,
            bottom: 110,
            child: Leaf(width: 50, height: 130, opacity: 0.35, angle: 0.3),
          ),
          if (!mobile)
            const Positioned(
              right: 36,
              top: -30,
              child: Leaf(width: 64, height: 160, opacity: 0.45, angle: 2.6),
            ),
          // Content.
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.horizontalPadding(context),
              vertical: mobile ? 64 : 88,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 580),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(eyebrow.toUpperCase(), style: AppText.eyebrow),
                        const SizedBox(height: 18),
                        Text(
                          title,
                          style: AppText.h1.copyWith(
                            fontSize: titleSize ??
                                Responsive.value<double>(
                                  context,
                                  mobile: 42,
                                  tablet: 52,
                                  desktop: 62,
                                ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          body,
                          style: AppText.body.copyWith(
                            color: AppColors.textDark.withAlpha(210),
                          ),
                        ),
                        if (action != null) ...[
                          const SizedBox(height: 32),
                          action!,
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
