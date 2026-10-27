import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../data/models/stat_model.dart';

class StatCard extends StatelessWidget {
  const StatCard({super.key, required this.stat});

  final StatModel stat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(stat.icon, color: AppColors.primary, size: 26),
          const SizedBox(height: 10),
          Text(
            stat.value,
            style: AppText.h3.copyWith(
              fontSize: 36,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.label,
            textAlign: TextAlign.center,
            style: AppText.small.copyWith(color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
