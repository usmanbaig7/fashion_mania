import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/mock/banners.dart';
import '../../../data/mock/categories.dart';
import '../../../data/mock/products.dart';
import '../../../data/models/banner_item.dart';
import '../../../data/models/category.dart';
import '../../../data/models/product.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadHome();
  }

  static const List<String> saleFilters = <String>[
    'All',
    'Newest',
    'Popular',
    'Man',
    'Women',
  ];

  /// Reads straight from the static mock lists — there is no backend yet.
  void loadHome() {
    emit(
      state.copyWith(
        banners: mockBanners,
        categories: mockCategories,
        products: mockProducts,
        filters: saleFilters,
        selectedFilter: saleFilters[1],
      ),
    );
  }

  void filterSelected(String filter) {
    emit(state.copyWith(selectedFilter: filter));
  }

  void bannerChanged(int index) {
    emit(state.copyWith(bannerIndex: index));
  }
}
