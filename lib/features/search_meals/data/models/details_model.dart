class DetailsModel {
  final String name;
  final String imagePath;
  final String category;
  final String area;
  final String instructions;
  final String youTubeURL;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String ingredient5;
  final String ingredient6;
  final String ingredient7;
  final String measure1;
  final String measure2;
  final String measure3;
  final String measure4;
  final String measure5;
  final String measure6;
  final String measure7;
  final String sourceURL;

  DetailsModel({
    required this.name,
    required this.imagePath,
    required this.category,
    required this.area,
    required this.instructions,
    required this.youTubeURL,
    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
    required this.ingredient4,
    required this.ingredient5,
    required this.ingredient6,
    required this.ingredient7,
    required this.measure1,
    required this.measure2,
    required this.measure3,
    required this.measure4,
    required this.measure5,
    required this.measure6,
    required this.measure7,
    required this.sourceURL,
  });

  factory DetailsModel.fromJson(json) {
    return DetailsModel(
      name: json['strMeal'] ?? "Unknown Meal",
      imagePath: json['strMealThumb'] ?? "",
      category: json['strCategory'] ?? "Unknown Category",
      area: json['strArea'] ?? "Unknown Area",
      instructions: json['strInstructions'] ?? "No instructions available",
      youTubeURL:
          json['strYoutube'] ?? "https://www.youtube.com/watch?v=3_UAxkx0u6U",
      ingredient1: json['strIngredient1'] ?? "",
      ingredient2: json['strIngredient2'] ?? "",
      ingredient3: json['strIngredient3'] ?? "",
      ingredient4: json['strIngredient4'] ?? "",
      ingredient5: json['strIngredient5'] ?? "",
      ingredient6: json['strIngredient5'] ?? "",
      ingredient7: json['strIngredient7'] ?? "",
      measure1: json['strMeasure1'] ?? "",
      measure2: json['strMeasure2'] ?? "",
      measure3: json['strMeasure3'] ?? "",
      measure4: json['strMeasure4'] ?? "",
      measure5: json['strMeasure5'] ?? "",
      measure6: json['strMeasure5'] ?? "",
      measure7: json['strMeasure5'] ?? "",
      sourceURL: json['strSource'] ?? "",
    );
  }
}
