import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography. Serif for headings (like the mockups), DM Sans for body.
class AppText {
  AppText._();

  static TextStyle get h1 => GoogleFonts.cormorantGaramond(
        fontSize: 58,
        fontWeight: FontWeight.w600,
        height: 1.05,
        color: AppColors.primaryDark,
      );

  static TextStyle get h2 => GoogleFonts.cormorantGaramond(
        fontSize: 42,
        fontWeight: FontWeight.w600,
        height: 1.1,
        color: AppColors.primaryDark,
      );

  static TextStyle get h3 => GoogleFonts.cormorantGaramond(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: AppColors.primaryDark,
      );

  static TextStyle get eyebrow => GoogleFonts.dmSans(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 3,
        color: AppColors.primary,
      );

  static TextStyle get title => GoogleFonts.dmSans(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: AppColors.textDark,
      );

  static TextStyle get body => GoogleFonts.dmSans(
        fontSize: 16,
        height: 1.65,
        color: AppColors.textMuted,
      );

  static TextStyle get small => GoogleFonts.dmSans(
        fontSize: 13.5,
        height: 1.55,
        color: AppColors.textMuted,
      );

  static TextStyle get button => GoogleFonts.dmSans(
        fontSize: 14.5,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      );

  static TextStyle get nav => GoogleFonts.dmSans(
        fontSize: 14.5,
        fontWeight: FontWeight.w500,
        color: AppColors.textDark,
      );

  /// Handwritten accent ("Let's grow together", "Plan · Analyse · Grow").
  static TextStyle get script => GoogleFonts.caveat(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryDark,
      );
}

/// Firm details used across the site.
/// TODO: replace placeholders with the client's real details.
class AppInfo {
  AppInfo._();

  static const name = 'Sri Fin Astra';
  static const tagline = 'Financial Services';
  // static const city = 'Hyderabad';
  static const phone = '+91 8500586702';
  static const phoneRaw = '+918500586702';
  static const email = 'contact@srifinastra.com';
  // static const address = 'Hyderabad, Telangana, India';
  static const hours = 'Mon – Sat, 10:00 AM – 7:00 PM';

  static const linkedIn = 'https://www.linkedin.com/';
  static const instagram = 'https://www.instagram.com/srifinastra?srtk=Njl5czI5ejd3YXoy';
  static const youtube = 'https://www.youtube.com/';
}