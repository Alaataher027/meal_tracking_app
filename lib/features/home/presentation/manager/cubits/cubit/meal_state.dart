part of 'meal_cubit.dart';

@immutable
sealed class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealSuccess extends MealState {}

class MealError extends MealState {
  final String message;
  MealError(this.message);
}
