import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_text.dart';

/// Site logo: always the real logo image
/// (assets/images/branding/sri_fin_astra_logo.png).
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.height = 52});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.logo,
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.medium,
      semanticLabel: AppInfo.name,
      // Only shows if the file is missing.
      errorBuilder: (context, error, stackTrace) =>
          Text(AppInfo.name, style: AppText.title),
    );
  }
}
