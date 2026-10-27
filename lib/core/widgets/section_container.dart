import 'package:flutter/material.dart';

import '../responsive/breakpoints.dart';
import '../responsive/responsive.dart';

/// Full-width band with a background, and centred content capped at
/// [Breakpoints.maxContentWidth]. Every page section sits in one of these.
class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.child,
    this.background,
    this.gradient,
    this.verticalPadding,
    this.topPadding,
    this.bottomPadding,
    this.maxWidth = Breakpoints.maxContentWidth,
  });

  final Widget child;
  final Color? background;
  final Gradient? gradient;
  final double? verticalPadding;
  final double? topPadding;
  final double? bottomPadding;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final v = verticalPadding ?? Responsive.sectionSpacing(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: background, gradient: gradient),
      padding: EdgeInsets.fromLTRB(
        Responsive.horizontalPadding(context),
        topPadding ?? v,
        Responsive.horizontalPadding(context),
        bottomPadding ?? v,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: child,
        ),
      ),
    );
  }
}
