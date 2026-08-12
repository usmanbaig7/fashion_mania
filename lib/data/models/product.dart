class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.subCategory,
    required this.price,
    this.images = const <String>[],
    this.sizes = const <String>[],
    this.colors = const <String>[],
    this.description = '',
    this.rating = 0,
  });

  final String id;
  final String name;

  /// 'boys' or 'girls'.
  final String category;

  /// 'dress', 'suit', 'casual', …
  final String subCategory;
  final double price;

  /// Empty until real artwork is added — the UI falls back to a placeholder.
  final List<String> images;
  final List<String> sizes;
  final List<String> colors;
  final String description;
  final double rating;
}
