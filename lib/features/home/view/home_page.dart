import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../custom_widgets/banner_card.dart';
import '../../../custom_widgets/category_chip.dart';
import '../../../custom_widgets/category_circle.dart';
import '../../../custom_widgets/product_card.dart';
import '../../../custom_widgets/section_header.dart';
import '../../wishlist/bloc/wishlist_cubit.dart';
import '../bloc/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController bannerController = PageController();
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    bannerController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              // Bottom padding clears the floating navigation pill.
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.border),
                          ),
                          child: const Icon(
                            Icons.notifications_none,
                            size: 22,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Positioned(
                          top: 11,
                          right: 12,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                size: 20,
                                color: AppColors.textSecondary,
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: searchController,
                                  style: AppTextStyles.fieldInput,
                                  cursorColor: AppColors.primary,
                                  decoration: const InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: AppTextStyles.fieldHint,
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.tune,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 168,
                    child: PageView.builder(
                      controller: bannerController,
                      itemCount: state.banners.length,
                      onPageChanged: context.read<HomeCubit>().bannerChanged,
                      itemBuilder: (context, index) {
                        return BannerCard(
                          banner: state.banners[index],
                          onActionTap: () {},
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.banners.length, (index) {
                      final isActive = index == state.bannerIndex;
                      return Container(
                        width: isActive ? 8 : 7,
                        height: isActive ? 8 : 7,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppColors.primary
                              : AppColors.border,
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  SectionHeader(
                    title: 'Category',
                    actionLabel: 'See All',
                    onActionTap: () {},
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: state.categories
                        .map(
                          (category) =>
                              CategoryCircle(category: category, onTap: () {}),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.filters.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        final filter = state.filters[index];
                        return CategoryChip(
                          label: filter,
                          isSelected: filter == state.selectedFilter,
                          onTap: () =>
                              context.read<HomeCubit>().filterSelected(filter),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: state.products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.66,
                        ),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return BlocBuilder<WishlistCubit, WishlistState>(
                        builder: (context, wishlist) {
                          return ProductCard(
                            product: product,
                            isWishlisted: wishlist.contains(product.id),
                            onTap: () {},
                            onWishlistTap: () =>
                                context.read<WishlistCubit>().toggle(product),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
