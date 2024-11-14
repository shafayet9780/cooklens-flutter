class RecipePreview {
  final String id;
  final String title;
  final String imageUrl;
  final String cookTime;
  final double rating;
  final String difficulty;

  const RecipePreview({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.cookTime,
    required this.rating,
    required this.difficulty,
  });
}