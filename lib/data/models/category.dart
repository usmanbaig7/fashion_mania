import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.gender,
  });

  final String id;
  final String name;

  /// Stands in for the category artwork until real assets are added.
  final IconData icon;

  /// 'boys' or 'girls'.
  final String gender;
}
