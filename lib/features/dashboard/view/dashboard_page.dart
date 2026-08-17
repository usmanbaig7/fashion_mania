import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_colors.dart';
import '../../../custom_widgets/app_bottom_nav_bar.dart';
import '../../../custom_widgets/coming_soon_view.dart';
import '../../home/view/home_page.dart';
import '../../wishlist/view/wishlist_page.dart';
import '../bloc/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: Stack(
              children: [
                IndexedStack(
                  index: state.tabIndex,
                  children: const [
                    HomePage(),
                    ComingSoonView(
                      title: 'Cart',
                      icon: Icons.shopping_bag_outlined,
                    ),
                    WishlistPage(),
                    ComingSoonView(
                      title: 'Categories',
                      icon: Icons.grid_view_rounded,
                    ),
                    ComingSoonView(
                      title: 'Profile',
                      icon: Icons.person_outline,
                    ),
                  ],
                ),
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: MediaQuery.paddingOf(context).bottom + 12,
                  child: AppBottomNavBar(
                    items: DashboardCubit.navItems,
                    currentIndex: state.tabIndex,
                    onTap: context.read<DashboardCubit>().tabSelected,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
