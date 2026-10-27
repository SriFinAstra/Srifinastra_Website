import 'package:flutter/material.dart';

import '../footer/app_footer.dart';
import '../navbar/app_navbar.dart';
import 'whatsapp_button.dart';

/// Common page frame: sticky navbar, scrollable sections, footer.
class PageScaffold extends StatelessWidget {
  const PageScaffold({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppNavDrawer(),
      floatingActionButton: const WhatsAppButton(),
      body: Column(
        children: [
          const AppNavbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ...children,
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
