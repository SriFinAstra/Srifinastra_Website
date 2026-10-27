import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text.dart';
import '../responsive/responsive.dart';

/// Eyebrow + heading + subtitle. Centred titles get the thin terracotta
/// lines either side of the eyebrow, like "—— OUR SERVICES ——".
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    this.eyebrow,
    this.title,
    this.subtitle,
    this.centered = false,
    this.light = false,
  });

  final String? eyebrow;
  final String? title;
  final String? subtitle;
  final bool centered;

  /// White text, for dark backgrounds.
  final bool light;

  @override
  Widget build(BuildContext context) {
    final align = centered ? TextAlign.center : TextAlign.start;

    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (eyebrow != null)
          centered
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _Line(),
                    const SizedBox(width: 16),
                    Text(eyebrow!.toUpperCase(), style: AppText.eyebrow),
                    const SizedBox(width: 16),
                    const _Line(),
                  ],
                )
              : Text(eyebrow!.toUpperCase(), style: AppText.eyebrow),
        if (title != null) ...[
          if (eyebrow != null) const SizedBox(height: 14),
          Text(
            title!,
            textAlign: align,
            style: AppText.h2.copyWith(
              fontSize:
                  Responsive.value<double>(context, mobile: 32, desktop: 42),
              color: light ? AppColors.white : null,
            ),
          ),
        ],
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(
              subtitle!,
              textAlign: align,
              style: AppText.body.copyWith(
                color: light ? AppColors.textLight : null,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _Line extends StatelessWidget {
  const _Line();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 1.2,
      color: AppColors.accent.withAlpha(170),
    );
  }
}
