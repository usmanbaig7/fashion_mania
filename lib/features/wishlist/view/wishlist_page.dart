import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/product_card.dart';
import '../../../custom_widgets/section_header.dart';
import '../bloc/wishlist_cubit.dart';

/// Wishlist tab — everything the user favourited from the home grid.
class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistState>(
      builder: (context, state) {
        return SafeArea(
          bottom: false,
          child: Padding(
            // Bottom padding clears the floating navigation pill.
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 110),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(
                  title: 'Wishlist',
                  actionLabel: state.isEmpty ? null : 'Clear All',
                  onActionTap: context.read<WishlistCubit>().clear,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: state.isEmpty
                      ? const _EmptyWishlist()
                      : GridView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: state.items.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 20,
                                childAspectRatio: 0.66,
                              ),
                          itemBuilder: (context, index) {
                            final product = state.items[index];
                            return ProductCard(
                              product: product,
                              isWishlisted: true,
                              onTap: () => context.push(
                                AppRoutes.productDetail,
                                extra: product,
                              ),
                              onWishlistTap: () => context
                                  .read<WishlistCubit>()
                                  .remove(product.id),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmptyWishlist extends StatelessWidget {
  const _EmptyWishlist();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: const BoxDecoration(
              color: AppColors.surfaceSoft,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.favorite_border,
              size: 36,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          const Text('No favourites yet', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 6),
          const Text(
            'Tap the heart on any product to save it here.',
            textAlign: TextAlign.center,
            style: AppTextStyles.caption,
          ),
        ],
      ),
    );
  }
}
