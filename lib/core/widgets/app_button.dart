import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text.dart';

enum AppButtonVariant { filled, outline, light }

/// Pill-shaped button used everywhere on the site.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.filled,
    this.showArrow = false,
    this.compact = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool showArrow;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final padding = compact
        ? const EdgeInsets.symmetric(horizontal: 20, vertical: 14)
        : const EdgeInsets.symmetric(horizontal: 26, vertical: 18);

    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        if (showArrow) ...[
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_rounded, size: 17),
        ],
      ],
    );

    switch (variant) {
      case AppButtonVariant.filled:
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            padding: padding,
            shape: const StadiumBorder(),
            textStyle: AppText.button,
          ),
          child: child,
        );
      case AppButtonVariant.outline:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
            side: const BorderSide(color: AppColors.primaryDark, width: 1.2),
            padding: padding,
            shape: const StadiumBorder(),
            textStyle: AppText.button,
          ),
          child: child,
        );
      case AppButtonVariant.light:
        return FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.white,
            foregroundColor: AppColors.primaryDark,
            padding: padding,
            shape: const StadiumBorder(),
            textStyle: AppText.button,
          ),
          child: child,
        );
    }
  }
}
