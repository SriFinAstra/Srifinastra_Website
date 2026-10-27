import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/responsive/responsive.dart';
import '../../../core/widgets/leaf.dart';
import '../../../core/widgets/responsive_layout.dart';
import '../../../core/widgets/section_container.dart';
import '../../../data/models/stat_model.dart';
import '../../../shared/widgets/stat_card.dart';

class StatisticsSection extends StatelessWidget {
  const StatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = Responsive.isMobile(context);
    const stats = StatModel.home;

    final Widget content = mobile
        ? ResponsiveGrid(
            mobileColumns: 2,
            runSpacing: 28,
            children: [for (final s in stats) StatCard(stat: s)],
          )
        : IntrinsicHeight(
            child: Row(
              children: [
                for (var i = 0; i < stats.length; i++) ...[
                  if (i > 0)
                    const VerticalDivider(
                      color: AppColors.sage,
                      thickness: 1,
                      width: 1,
                      indent: 8,
                      endIndent: 8,
                    ),
                  Expanded(child: StatCard(stat: stats[i])),
                ],
              ],
            ),
          );

    return Stack(
      children: [
        Positioned.fill(child: Container(color: AppColors.mint)),
        const Positioned(
          left: -16,
          top: -10,
          child: Leaf(width: 50, height: 120, opacity: 0.5, angle: 0.9),
        ),
        const Positioned(
          right: -10,
          bottom: -20,
          child: Leaf(width: 46, height: 110, opacity: 0.4, angle: -0.5),
        ),
        SectionContainer(verticalPadding: 48, child: content),
      ],
    );
  }
}
