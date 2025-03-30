import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:alaa_taher/constants.dart';
import 'package:alaa_taher/features/home/data/models/meal_model.dart';
import 'package:meta/meta.dart';

part 'add_meal_state.dart';

class AddMealCubit extends Cubit<AddMealState> {
  AddMealCubit() : super(AddMealInitial());

  addMeal(MealModel meal) async {
    emit(AddMealLoading());
    try {
      var mealsBox = Hive.box<MealModel>(kMealsBox);
      await mealsBox.add(meal);
      emit(AddMealSuccess());
    } catch (e) {
      emit(AddMealFailure(e.toString()));
    }
  }
}
