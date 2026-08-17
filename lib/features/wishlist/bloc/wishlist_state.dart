part of 'wishlist_cubit.dart';

class WishlistState {
  const WishlistState({this.items = const <Product>[]});

  final List<Product> items;

  bool get isEmpty => items.isEmpty;

  bool contains(String productId) =>
      items.any((product) => product.id == productId);
}
