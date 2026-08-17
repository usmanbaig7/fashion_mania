import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/models/product.dart';
import 'image_placeholder.dart';

/// Grid tile for a single product. Shows the product's first image, or an
/// empty placeholder if it doesn't have one yet.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    this.isWishlisted = false,
    this.onWishlistTap,
  });

  final Product product;
  final VoidCallback onTap;
  final bool isWishlisted;
  final VoidCallback? onWishlistTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ImagePlaceholder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(16),
                    ),
                    imagePath: product.images.isNotEmpty
                        ? product.images.first
                        : null,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onWishlistTap,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: isWishlisted
                            ? AppColors.primary
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.productName,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: AppTextStyles.price,
              ),
              const Spacer(),
              const Icon(Icons.star, size: 13, color: Color(0xFFF5A623)),
              const SizedBox(width: 2),
              Text(
                product.rating.toStringAsFixed(1),
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
