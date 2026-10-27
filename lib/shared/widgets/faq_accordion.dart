import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text.dart';
import '../../data/faq_data.dart';

/// A stack of question cards that expand to show the answer.
class FaqAccordion extends StatelessWidget {
  const FaqAccordion({super.key, required this.items});

  final List<FaqItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _FaqTile(item: item),
          ),
      ],
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.item});

  final FaqItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
          expandedAlignment: Alignment.centerLeft,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          iconColor: AppColors.primary,
          collapsedIconColor: AppColors.primary,
          shape: const Border(),
          collapsedShape: const Border(),
          title: Text(item.question, style: AppText.title),
          children: [for (final line in item.answer) _AnswerLine(line)],
        ),
      ),
    );
  }
}

class _AnswerLine extends StatelessWidget {
  const _AnswerLine(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final style = AppText.body.copyWith(
      fontSize: 15,
      color: AppColors.textMuted,
      height: 1.6,
    );

    if (text.startsWith('• ')) {
      return Padding(
        padding: const EdgeInsets.only(left: 6, bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(text.substring(2), style: style)),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(text, style: style),
    );
  }
}
