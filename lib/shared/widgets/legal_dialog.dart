import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../core/constants/legal_text.dart';
import '../../core/responsive/responsive.dart';

/// Opens a scrollable pop-up with a policy (Privacy Policy / Terms).
Future<void> showLegalDialog(BuildContext context, LegalDoc doc) {
  return showDialog<void>(
    context: context,
    builder: (_) => _LegalDialog(doc: doc),
  );
}

class _LegalDialog extends StatefulWidget {
  const _LegalDialog({required this.doc});

  final LegalDoc doc;

  @override
  State<_LegalDialog> createState() => _LegalDialogState();
}

class _LegalDialogState extends State<_LegalDialog> {
  final _scroll = ScrollController();

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final doc = widget.doc;
    final mobile = Responsive.isMobile(context);
    final pad = mobile ? 20.0 : 28.0;

    return Dialog(
      backgroundColor: AppColors.background,
      insetPadding: EdgeInsets.symmetric(
        horizontal: mobile ? 16 : 40,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 760, maxHeight: 640),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(pad, 16, 12, 12),
              child: Row(
                children: [
                  Expanded(child: Text(doc.title, style: AppText.h3)),
                  IconButton(
                    tooltip: 'Close',
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: AppColors.border),
            Flexible(
              child: Scrollbar(
                controller: _scroll,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scroll,
                  padding: EdgeInsets.fromLTRB(pad, 20, pad, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last updated: ${doc.updated}',
                        style: AppText.small.copyWith(fontSize: 12.5),
                      ),
                      const SizedBox(height: 12),
                      Text(doc.intro, style: AppText.body),
                      for (final s in doc.sections) ...[
                        const SizedBox(height: 22),
                        Text(s.heading, style: AppText.title),
                        const SizedBox(height: 8),
                        for (final p in s.paragraphs)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              p,
                              style: AppText.body.copyWith(fontSize: 14.5),
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
