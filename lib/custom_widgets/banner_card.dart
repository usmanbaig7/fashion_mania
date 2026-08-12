import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import '../data/models/banner_item.dart';

/// Promo slide in the home carousel. The right-hand artwork is left empty
/// as a placeholder.
class BannerCard extends StatelessWidget {
  const BannerCard({
    super.key,
    required this.banner,
    required this.onActionTap,
  });

  final BannerItem banner;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceSoft,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 8, 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    banner.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.bannerTitle,
                  ),
                  const SizedBox(height: 6),
                  Flexible(
                    child: Text(
                      banner.subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption.copyWith(height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: onActionTap,
                    child: Container(
                      height: 34,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Text(
                        banner.actionLabel,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
              decoration: BoxDecoration(
                color: AppColors.placeholder,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.image_outlined,
                size: 30,
                color: AppColors.placeholderIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
