class BannerItem {
  const BannerItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    this.imageUrl = '',
  });

  final String id;
  final String title;
  final String subtitle;
  final String actionLabel;

  /// Empty until real artwork is added — the UI falls back to a placeholder.
  final String imageUrl;
}
