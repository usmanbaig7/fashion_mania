import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_widgets/app_bottom_nav_bar.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState());

  static const List<BottomNavItem> navItems = <BottomNavItem>[
    BottomNavItem(icon: Icons.home_outlined, label: 'Home'),
    BottomNavItem(icon: Icons.shopping_bag_outlined, label: 'Cart'),
    BottomNavItem(icon: Icons.favorite_border, label: 'Wishlist'),
    BottomNavItem(icon: Icons.grid_view_rounded, label: 'Categories'),
    BottomNavItem(icon: Icons.person_outline, label: 'Profile'),
  ];

  void tabSelected(int index) => emit(state.copyWith(tabIndex: index));
}
