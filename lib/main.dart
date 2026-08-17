import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/wishlist/bloc/wishlist_cubit.dart';

void main() {
  runApp(const FashionManiaApp());
}

class FashionManiaApp extends StatelessWidget {
  const FashionManiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wishlist sits above the router so pushed routes (product details) share
    // the same favourites as the dashboard tabs.
    return BlocProvider(
      create: (_) => WishlistCubit(),
      child: MaterialApp.router(
        title: 'Fashion Mania',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
