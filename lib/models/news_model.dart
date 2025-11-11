// lib/models/news_model.dart

class News {
  final String source;
  final String title;
  final String description;
  final String imageAsset;

  News({
    required this.source,
    required this.title,
    required this.description,
    required this.imageAsset,
  });
}