import 'package:flutter/widgets.dart';

import 'breakpoints.dart';

class Responsive {
  Responsive._();

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static bool isMobile(BuildContext context) =>
      width(context) < Breakpoints.tablet;

  static bool isTablet(BuildContext context) {
    final w = width(context);
    return w >= Breakpoints.tablet && w < Breakpoints.desktop;
  }

  static bool isDesktop(BuildContext context) =>
      width(context) >= Breakpoints.desktop;

  /// Pick a value per screen size. [tablet] falls back to [desktop].
  static T value<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }

  /// Side padding for page sections.
  static double horizontalPadding(BuildContext context) =>
      value<double>(context, mobile: 16, tablet: 28, desktop: 32);

  /// Vertical padding for page sections.
  static double sectionSpacing(BuildContext context) =>
      value<double>(context, mobile: 56, tablet: 72, desktop: 88);
}
