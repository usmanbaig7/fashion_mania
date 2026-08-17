import 'package:flutter/material.dart';

import '../models/category.dart';

const List<Category> mockCategories = <Category>[
  Category(
    id: 'c1',
    name: 'T-Shirt',
    icon: Icons.checkroom,
    gender: 'boys',
    imagePath: 'assets/images/shirt.jpg',
  ),
  Category(
    id: 'c2',
    name: 'Pant',
    icon: Icons.dry_cleaning,
    gender: 'boys',
    imagePath: 'assets/images/pant.jpg',
  ),
  Category(
    id: 'c3',
    name: 'Dress',
    icon: Icons.woman,
    gender: 'girls',
    imagePath: 'assets/images/dress.jpg',
  ),
  Category(
    id: 'c4',
    name: 'Jacket',
    icon: Icons.ac_unit,
    gender: 'boys',
    imagePath: 'assets/images/jacket.jpg',
  ),
];
