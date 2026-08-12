import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Empty stand-in for artwork that isn't wired up yet.
/// Pass a [borderRadius] for the arch shapes, or leave [isCircle] on for circles.
class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.borderRadius,
    this.isCircle = false,
    this.iconSize = 36,
  });

  final BorderRadius? borderRadius;
  final bool isCircle;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.placeholder,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : borderRadius,
      ),
      child: Icon(
        Icons.image_outlined,
        size: iconSize,
        color: AppColors.placeholderIcon,
      ),
    );
  }
}
