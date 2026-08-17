import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.gender,
    this.imagePath,
  });

  final String id;
  final String name;

  /// Fallback icon, used until/unless [imagePath] is set.
  final IconData icon;

  /// 'boys' or 'girls'.
  final String gender;

  /// Category artwork. Null falls back to [icon].
  final String? imagePath;
}
