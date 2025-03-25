import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_tracking_app/constants.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';
import 'package:meta/meta.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
  List<MealModel>? mealsList;

  featchAllMeals() async {
    emit(MealLoading()); // Add this state
    try {
      var mealsBox = Hive.box<MealModel>(kMealsBox);
      mealsList = mealsBox.values.toList();
      emit(MealSuccess());
    } catch (e) {
      emit(MealFailure(e.toString()));
    }
  }

  void sortMeals(String criteria) {
    if (criteria == "name") {
      mealsList?.sort(
        (a, b) => (a.mealName ?? "").compareTo(b.mealName ?? ""),
      );
    } else if (criteria == "calories") {
      mealsList?.sort(
        (a, b) => (a.calories ?? 0).compareTo(b.calories ?? 0),
      );
    } else if (criteria == "time") {
      mealsList?.sort(
        (a, b) => (a.dateTime ?? DateTime.now()).compareTo(
          b.dateTime ?? DateTime.now(),
        ),
      );
    }
    emit(MealSuccess());
  }

  // Future<void> deleteMeal(int index) async {
  //   try {
  //     var mealsBox = Hive.openBox<MealModel>(kMealsBox);
  //     await mealsBox.deleteAt(index);
  //     mealsList?.removeAt(index);
  //     emit(MealSuccess());
  //   } on Exception catch (e) {
  //     emit(MealError(e.toString()));
  //   }
  // }
}
