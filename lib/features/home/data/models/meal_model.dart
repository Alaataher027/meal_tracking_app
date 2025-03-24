import 'package:hive/hive.dart';
part 'meal_model.g.dart';

@HiveType(typeId: 0)
class MealModel extends HiveObject {
  @HiveField(0)
  String? mealName;

  @HiveField(1)
  int? calories;

  @HiveField(2)
  DateTime? dateTime;

  @HiveField(3)
  String? imagePath;

  MealModel({
    this.mealName,
    this.calories,
    this.dateTime,
    this.imagePath,
  });
}
