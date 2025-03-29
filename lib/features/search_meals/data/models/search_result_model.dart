class SearchResultModel {
  final String name;
  final String imagePath;

  SearchResultModel({
    required this.name,
    required this.imagePath,
  });

  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
      name: json['strMeal'] ?? "Unknown Meal",
      imagePath: json['strMealThumb'] ?? "",
    );
  }
}
