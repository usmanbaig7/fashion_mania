import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product.dart';

part 'wishlist_state.dart';

/// Holds the favourited products. Lives above the dashboard so the home tab
/// and the wishlist tab share one list.
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState());

  void toggle(Product product) {
    state.contains(product.id) ? remove(product.id) : add(product);
  }

  void add(Product product) {
    if (state.contains(product.id)) return;
    emit(WishlistState(items: <Product>[...state.items, product]));
  }

  void remove(String productId) {
    emit(
      WishlistState(
        items: state.items
            .where((product) => product.id != productId)
            .toList(growable: false),
      ),
    );
  }

  void clear() => emit(const WishlistState());
}
