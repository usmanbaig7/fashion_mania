import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/primary_button.dart';
import '../../../data/models/product.dart';
import '../../wishlist/bloc/wishlist_cubit.dart';
import '../bloc/product_detail_cubit.dart';

/// Full product screen: gallery on a cream backdrop, details sheet below,
/// and a pinned total price + "Add to Cart" bar.
class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailCubit(product),
      child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Column(
              children: [
                _Gallery(product: product, state: state),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                    child: _Details(product: product, state: state),
                  ),
                ),
                _CheckoutBar(product: product),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Cream header: nav row, active image, and the thumbnail strip.
class _Gallery extends StatelessWidget {
  const _Gallery({required this.product, required this.state});

  final Product product;
  final ProductDetailState state;

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.sizeOf(context).height * 0.34).clamp(
      220.0,
      340.0,
    );

    return Container(
      color: AppColors.surfaceSoft,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Row(
                children: [
                  _RoundIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => context.pop(),
                  ),
                  const Expanded(
                    child: Text(
                      'Product Details',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.sectionTitle,
                    ),
                  ),
                  BlocBuilder<WishlistCubit, WishlistState>(
                    builder: (context, wishlist) {
                      final isWishlisted = wishlist.contains(product.id);
                      return _RoundIconButton(
                        icon: isWishlisted
                            ? Icons.favorite
                            : Icons.favorite_border,
                        iconColor: isWishlisted
                            ? AppColors.primary
                            : AppColors.textPrimary,
                        onTap: () =>
                            context.read<WishlistCubit>().toggle(product),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height,
              child: Stack(
                children: [
                  Positioned.fill(child: _activeImage()),
                  if (product.images.length > 1)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 12,
                      child: _ThumbnailStrip(
                        product: product,
                        activeIndex: state.imageIndex,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeImage() {
    if (product.images.isEmpty) {
      return const Center(
        child: Icon(
          Icons.image_outlined,
          size: 56,
          color: AppColors.placeholderIcon,
        ),
      );
    }
    final index = state.imageIndex.clamp(0, product.images.length - 1);
    return Image.asset(product.images[index], fit: BoxFit.cover);
  }
}

/// Up to five tappable thumbnails; the last shows "+N" when more remain.
class _ThumbnailStrip extends StatelessWidget {
  const _ThumbnailStrip({required this.product, required this.activeIndex});

  static const int _maxVisible = 5;

  final Product product;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final images = product.images;
    final visible = images.length <= _maxVisible ? images.length : _maxVisible;
    final hidden = images.length - visible;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(visible, (index) {
            final isLast = index == visible - 1;
            final overflow = isLast && hidden > 0;
            return Padding(
              padding: EdgeInsets.only(right: isLast ? 0 : 8),
              child: GestureDetector(
                onTap: () =>
                    context.read<ProductDetailCubit>().imageSelected(index),
                child: Container(
                  width: 52,
                  height: 60,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: index == activeIndex
                          ? AppColors.primary
                          : Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(images[index], fit: BoxFit.cover),
                      if (overflow)
                        ColoredBox(
                          color: Colors.black.withValues(alpha: 0.45),
                          child: Center(
                            child: Text(
                              '+$hidden',
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
            );
          }),
        ),
      ),
    );
  }
}

/// Everything in the white sheet: title, description, size and colour pickers.
class _Details extends StatelessWidget {
  const _Details({required this.product, required this.state});

  final Product product;
  final ProductDetailState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                _styleLabel(product.category),
                style: AppTextStyles.caption,
              ),
            ),
            const Icon(Icons.star, size: 16, color: Color(0xFFF5A623)),
            const SizedBox(width: 4),
            Text(
              product.rating.toStringAsFixed(1),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(product.name, style: AppTextStyles.heading),
        const SizedBox(height: 20),
        const Text('Product Details', style: AppTextStyles.sectionTitle),
        const SizedBox(height: 8),
        _ExpandableText(
          text: product.description,
          isExpanded: state.descriptionExpanded,
          onToggle: cubit.toggleDescription,
        ),
        const SizedBox(height: 20),
        const Divider(color: AppColors.divider, height: 1),
        if (product.sizes.isNotEmpty) ...[
          const SizedBox(height: 20),
          const Text('Select Size', style: AppTextStyles.sectionTitle),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: product.sizes
                .map(
                  (size) => _SizeBox(
                    label: size,
                    isSelected: size == state.selectedSize,
                    onTap: () => cubit.sizeSelected(size),
                  ),
                )
                .toList(),
          ),
        ],
        if (product.colors.isNotEmpty) ...[
          const SizedBox(height: 22),
          Row(
            children: [
              const Text('Select Color : ', style: AppTextStyles.sectionTitle),
              Text(state.selectedColor, style: AppTextStyles.subtitle),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: product.colors
                .map(
                  (color) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _ColorDot(
                      name: color,
                      isSelected: color == state.selectedColor,
                      onTap: () => cubit.colorSelected(color),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ],
    );
  }

  /// Mirrors the mock data's 'girls'/'boys' split.
  static String _styleLabel(String category) {
    switch (category) {
      case 'girls':
        return 'Female’s Style';
      case 'boys':
        return 'Male’s Style';
      default:
        return 'Unisex Style';
    }
  }
}

/// Description clamped to three lines, with a Read more/less toggle that only
/// appears when the text actually overflows.
class _ExpandableText extends StatelessWidget {
  const _ExpandableText({
    required this.text,
    required this.isExpanded,
    required this.onToggle,
  });

  static const int _collapsedLines = 3;

  final String text;
  final bool isExpanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = TextPainter(
          text: TextSpan(text: text, style: AppTextStyles.subtitle),
          maxLines: _collapsedLines,
          textDirection: Directionality.of(context),
        )..layout(maxWidth: constraints.maxWidth);
        final overflows = painter.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppTextStyles.subtitle,
              maxLines: isExpanded ? null : _collapsedLines,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            if (overflows)
              GestureDetector(
                onTap: onToggle,
                behavior: HitTestBehavior.opaque,
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    isExpanded ? 'Read less' : 'Read more',
                    style: AppTextStyles.link,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class _SizeBox extends StatelessWidget {
  const _SizeBox({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.background,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  /// Colour names used by the mock catalogue.
  static const Map<String, Color> _swatches = <String, Color>{
    'Brown': Color(0xFF8B5E3C),
    'Beige': Color(0xFFE0CDB0),
    'Red': Color(0xFFC0392B),
    'Navy': Color(0xFF1F3A5F),
    'Cream': Color(0xFFF1E4D0),
    'Rose': Color(0xFFE4A0A8),
    'Charcoal': Color(0xFF3A3A3A),
    'Indigo': Color(0xFF3F51B5),
    'Grey': Color(0xFF9E9E9E),
  };

  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final swatch = _swatches[name] ?? AppColors.placeholder;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 34,
        height: 34,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: swatch,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
          ),
        ),
      ),
    );
  }
}

/// Pinned bottom bar with the running total and the cart action.
class _CheckoutBar extends StatelessWidget {
  const _CheckoutBar({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        16,
        24,
        16 + MediaQuery.paddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, -6),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Total Price', style: AppTextStyles.caption),
              const SizedBox(height: 2),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: AppTextStyles.price.copyWith(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: PrimaryButton(
              label: 'Add to Cart',
              icon: Icons.shopping_bag_outlined,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

/// White circular button used by the gallery header.
class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor = AppColors.textPrimary,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: AppColors.background,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}
