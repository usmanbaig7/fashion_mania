import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product.dart';

part 'product_detail_state.dart';

/// Tracks the gallery/size/colour selections for one product.
class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit(this.product)
    : super(
        ProductDetailState(
          selectedSize: product.sizes.isEmpty ? '' : product.sizes.first,
          selectedColor: product.colors.isEmpty ? '' : product.colors.first,
        ),
      );

  final Product product;

  void imageSelected(int index) => emit(state.copyWith(imageIndex: index));

  void sizeSelected(String size) => emit(state.copyWith(selectedSize: size));

  void colorSelected(String color) => emit(state.copyWith(selectedColor: color));

  void toggleDescription() =>
      emit(state.copyWith(descriptionExpanded: !state.descriptionExpanded));
}
