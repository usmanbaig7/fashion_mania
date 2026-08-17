import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// Empty stand-in for artwork that isn't wired up yet.
/// Pass a [borderRadius] for the arch shapes, or leave [isCircle] on for circles.
/// Pass [imagePath] to render an actual asset image instead of the placeholder icon.
class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({
    super.key,
    this.borderRadius,
    this.isCircle = false,
    this.iconSize = 36,
    this.imagePath,
  });

  final BorderRadius? borderRadius;
  final bool isCircle;
  final double iconSize;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      final image = Image.asset(imagePath!, fit: BoxFit.cover);
      return isCircle
          ? ClipOval(child: image)
          : ClipRRect(
              borderRadius: borderRadius ?? BorderRadius.zero,
              child: image,
            );
    }

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
