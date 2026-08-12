import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

/// One destination in [AppBottomNavBar].
class BottomNavItem {
  const BottomNavItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// Floating dark pill navigation. The selected destination is lifted into a
/// white circle that sits slightly above the bar.
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  final List<BottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.navBackground,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(index),
              // Every destination shares the bar's center line, so the
              // selected circle sits dead centre rather than riding high.
              child: Center(
                child: isSelected
                    ? Container(
                        width: 52,
                        height: 52,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Icon(
                              items[index].icon,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Icon(
                        items[index].icon,
                        size: 24,
                        color: AppColors.navInactive,
                      ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
