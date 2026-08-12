import 'package:flutter/material.dart';

/// App-wide color palette. Every color used in the UI comes from here.
class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFF704F38);
  static const Color background = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF8A8A8A);

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFE6E6E6);

  /// Fill used for empty image placeholders and the avatar circle.
  static const Color placeholder = Color(0xFFEDEDED);
  static const Color placeholderIcon = Color(0xFFBDBDBD);
}
