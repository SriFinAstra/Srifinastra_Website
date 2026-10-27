import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/widgets/section_container.dart';
import '../../../shared/widgets/value_card.dart';

class ValuesSection extends StatelessWidget {
  const ValuesSection({super.key});

  static const _values = [
    ValueCard(
      icon: Icons.verified_user_outlined,
      title: 'Integrity',
      subtitle: 'We do what is right.',
    ),
    ValueCard(
      icon: Icons.groups_2_outlined,
      title: 'Expertise',
      subtitle: 'Proven knowledge & experience.',
    ),
    ValueCard(
      icon: Icons.track_changes_rounded,
      title: 'Client Focus',
      subtitle: 'Your goals, our priority.',
    ),
    ValueCard(
      icon: Icons.trending_up_rounded,
      title: 'Long-Term Value',
      subtitle: 'Sustainable growth.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);

    final Widget content = mobile
        ? const ResponsiveGrid(
            mobileColumns: 2,
            runSpacing: 24,
            spacing: 8,
            children: _values,
          )
        : IntrinsicHeight(
            child: Row(
              children: [
                for (var i = 0; i < _values.length; i++) ...[
                  if (i > 0)
                    const VerticalDivider(
                      color: AppColors.sage,
                      width: 1,
                      thickness: 1,
                      indent: 6,
                      endIndent: 6,
                    ),
                  Expanded(child: _values[i]),
                ],
              ],
            ),
          );

    return SectionContainer(
      topPadding: 0,
      bottomPadding: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 32,
          horizontal: mobile ? 12 : 20,
        ),
        decoration: BoxDecoration(
          color: AppColors.mint,
          borderRadius: BorderRadius.circular(18),
        ),
        child: content,
      ),
    );
  }
}
