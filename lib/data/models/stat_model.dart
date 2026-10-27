import 'package:flutter/material.dart';

class StatModel {
  const StatModel({
    required this.value,
    required this.label,
    required this.icon,
  });

  final String value;
  final String label;
  final IconData icon;

  // TODO: confirm numbers with the client.
  static const List<StatModel> home = [
    StatModel(
      value: '10+',
      label: 'Years of Experience',
      icon: Icons.emoji_events_outlined,
    ),
    StatModel(
      value: '500+',
      label: 'Happy Clients',
      icon: Icons.thumb_up_alt_outlined,
    ),
    StatModel(
      value: '1000+',
      label: 'Tax Filings',
      icon: Icons.description_outlined,
    ),
    StatModel(
      value: '100+',
      label: 'Businesses Supported',
      icon: Icons.business_center_outlined,
    ),
  ];
}
