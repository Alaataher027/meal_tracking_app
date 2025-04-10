import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/features/home/data/models/meal_model.dart';
import 'package:meta/meta.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
  List<MealModel>? mealsList;
  List<MealModel> filteredMeals = [];
  int totalCalories = 0;
  DateTime? selectedDate;

  featchAllMeals() async {
    emit(MealLoading());
    try {
      var mealsBox = Hive.box<MealModel>(kMealsBox);
      mealsList = mealsBox.values.toList();
      applyFiltersAndSort();
    } catch (e) {
      emit(MealFailure(e.toString()));
    }
  }

  void sortMeals(String criteria) {
    if (criteria == "name") {
      mealsList?.sort((a, b) => (a.mealName ?? "").compareTo(b.mealName ?? ""));
    } else if (criteria == "calories") {
      mealsList?.sort((a, b) => (a.calories ?? 0).compareTo(b.calories ?? 0));
    } else if (criteria == "time") {
      mealsList?.sort((a, b) => (a.dateTime!.hour).compareTo(b.dateTime!.hour));
    }
    applyFiltersAndSort();
  }

  void filterMealsByDate(DateTime? date) {
    selectedDate = date ?? DateTime.now();
    applyFiltersAndSort();
  }

  void applyFiltersAndSort() {
    if (selectedDate != null) {
      filteredMeals = mealsList
              ?.where((meal) =>
                  meal.dateTime != null &&
                  isSameDay(meal.dateTime!, selectedDate!))
              .toList() ??
          [];
    } else {
      filteredMeals = mealsList ?? [];
    }

    totalCalories =
        filteredMeals.fold(0, (sum, meal) => sum + (meal.calories ?? 0));

    emit(MealSuccess());
  }

  bool isSameDay(DateTime mealDate, DateTime selectedDate) {
    return mealDate.year == selectedDate.year &&
        mealDate.month == selectedDate.month &&
        mealDate.day == selectedDate.day;
  }
}
