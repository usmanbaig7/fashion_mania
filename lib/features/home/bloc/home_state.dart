part of 'home_cubit.dart';

class HomeState {
  const HomeState({
    this.banners = const <BannerItem>[],
    this.categories = const <Category>[],
    this.products = const <Product>[],
    this.filters = const <String>[],
    this.selectedFilter = '',
    this.bannerIndex = 0,
  });

  final List<BannerItem> banners;
  final List<Category> categories;
  final List<Product> products;
  final List<String> filters;
  final String selectedFilter;
  final int bannerIndex;

  HomeState copyWith({
    List<BannerItem>? banners,
    List<Category>? categories,
    List<Product>? products,
    List<String>? filters,
    String? selectedFilter,
    int? bannerIndex,
  }) {
    return HomeState(
      banners: banners ?? this.banners,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      filters: filters ?? this.filters,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      bannerIndex: bannerIndex ?? this.bannerIndex,
    );
  }
}
