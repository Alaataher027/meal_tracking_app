part of 'meal_cubit.dart';

@immutable
sealed class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {
  final List<MealModel> meals;
  MealLoaded(this.meals);
}

class MealError extends MealState {
  final String message;
  MealError(this.message);
}