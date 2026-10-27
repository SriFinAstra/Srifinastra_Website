import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Asset image that shows a soft branded placeholder when the file is
/// missing — so the site looks finished before the real photos arrive.
class AppImage extends StatelessWidget {
  const AppImage(
    this.path, {
    super.key,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.borderRadius,
    this.placeholderIcon = Icons.image_outlined,
    this.placeholderChild,
    this.semanticLabel,
  });

  final String path;
  final BoxFit fit;
  final Alignment alignment;
  final BorderRadius? borderRadius;
  final IconData placeholderIcon;

  /// Optional content drawn on the placeholder (e.g. handwritten text).
  final Widget? placeholderChild;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      path,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
      semanticLabel: semanticLabel,
      errorBuilder: (context, error, stackTrace) => _Placeholder(
        icon: placeholderIcon,
        child: placeholderChild,
      ),
    );

    if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }
    return image;
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.icon, this.child});

  final IconData icon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFDDEBE5), Color(0xFFF3EEE4), Color(0xFFF6E3D8)],
        ),
      ),
      alignment: Alignment.center,
      child: child ??
          Icon(icon, size: 48, color: AppColors.primary.withAlpha(60)),
    );
  }
}
