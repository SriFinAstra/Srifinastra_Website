import 'package:flutter/material.dart';

import '../responsive/responsive.dart';

/// Builds a different widget per screen size. [tablet] falls back to
/// [desktop].
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final WidgetBuilder desktop;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) return mobile(context);
    if (Responsive.isTablet(context)) return (tablet ?? desktop)(context);
    return desktop(context);
  }
}

/// Grid whose items in the same row share the tallest item's height,
/// so cards line up neatly. Column count changes per screen size.
///
/// Note: children must not contain a LayoutBuilder (IntrinsicHeight
/// can't measure it).
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileColumns = 1,
    this.tabletColumns = 2,
    this.desktopColumns = 4,
    this.spacing = 20,
    this.runSpacing = 20,
  });

  final List<Widget> children;
  final int mobileColumns;
  final int tabletColumns;
  final int desktopColumns;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    final cols = Responsive.value<int>(
      context,
      mobile: mobileColumns,
      tablet: tabletColumns,
      desktop: desktopColumns,
    );

    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += cols) {
      final rowItems = <Widget>[];
      for (var j = 0; j < cols; j++) {
        if (j > 0) rowItems.add(SizedBox(width: spacing));
        final index = i + j;
        rowItems.add(
          Expanded(
            child: index < children.length ? children[index] : const SizedBox(),
          ),
        );
      }
      if (rows.isNotEmpty) rows.add(SizedBox(height: runSpacing));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowItems,
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
