part of 'product_detail_cubit.dart';

class ProductDetailState {
  const ProductDetailState({
    this.imageIndex = 0,
    this.selectedSize = '',
    this.selectedColor = '',
    this.descriptionExpanded = false,
  });

  /// Index into the product's image gallery.
  final int imageIndex;
  final String selectedSize;
  final String selectedColor;
  final bool descriptionExpanded;

  ProductDetailState copyWith({
    int? imageIndex,
    String? selectedSize,
    String? selectedColor,
    bool? descriptionExpanded,
  }) {
    return ProductDetailState(
      imageIndex: imageIndex ?? this.imageIndex,
      selectedSize: selectedSize ?? this.selectedSize,
      selectedColor: selectedColor ?? this.selectedColor,
      descriptionExpanded: descriptionExpanded ?? this.descriptionExpanded,
    );
  }
}
