import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Circular outlined button for the "Or sign in with" providers row.
class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.child,
    required this.onTap,
    this.size = 56,
  });

  final Widget child;
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
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.border),
        ),
        child: child,
      ),
    );
  }
}
