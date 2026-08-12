import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Outlined circular back arrow shown at the top-left of the auth screens.
class CircleBackButton extends StatelessWidget {
  const CircleBackButton({super.key, required this.onTap, this.size = 42});

  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: const Icon(
          Icons.arrow_back,
          size: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
