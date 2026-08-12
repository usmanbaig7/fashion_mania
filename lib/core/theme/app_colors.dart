import 'package:flutter/material.dart';

/// App-wide color palette. Every color used in the UI comes from here.
class AppColors {
  const AppColors._();

  static const Color primary = Color(0xFF6B1420);
  static const Color background = Color(0xFFFFFFFF);

  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF8A8A8A);

  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFE6E6E6);

  /// Fill used for empty image placeholders and the avatar circle.
  static const Color placeholder = Color(0xFFF3E7CE);
  static const Color placeholderIcon = Color(0xFFB99A78);

  /// Soft cream used behind banners, category circles and the sale timer.
  static const Color surfaceSoft = Color(0xFFF7EFE0);

  /// Floating bottom navigation pill.
  static const Color navBackground = Color(0xFF1E1E1E);
  static const Color navInactive = Color(0xFFA3A3A3);
}
