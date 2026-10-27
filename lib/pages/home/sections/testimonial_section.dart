import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/leaf.dart';
import '../../../core/widgets/section_container.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    // TODO: replace with a real client testimonial.
    final quote = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '“',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 88,
            height: 0.9,
            color: AppColors.sage,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Professional, responsive and trustworthy. ${AppInfo.name} '
                  'has been our go-to for all financial and compliance needs.',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: mobile ? 22 : 26,
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '—  Client',
                  style: AppText.small.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    final script = Transform.rotate(
      angle: -0.12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Let's grow\n   together", style: AppText.script),
          Container(
            margin: const EdgeInsets.only(top: 4, right: 6),
            width: 90,
            height: 2,
            color: AppColors.accent,
          ),
        ],
      ),
    );

    return Stack(
      children: [
        const Positioned(
          right: -18,
          bottom: -24,
          child: Leaf(
            width: 60,
            height: 140,
            color: AppColors.accent,
            opacity: 0.4,
            angle: -0.9,
          ),
        ),
        SectionContainer(
          verticalPadding:
              Responsive.value<double>(context, mobile: 48, desktop: 64),
          child: mobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    quote,
                    const SizedBox(height: 28),
                    Align(alignment: Alignment.centerRight, child: script),
                  ],
                )
              : Row(
                  children: [
                    Expanded(child: quote),
                    const SizedBox(width: 64),
                    script,
                    const SizedBox(width: 24),
                  ],
                ),
        ),
      ],
    );
  }
}
