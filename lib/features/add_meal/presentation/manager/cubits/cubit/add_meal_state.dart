part of 'add_meal_cubit.dart';

@immutable
sealed class AddMealState {}

final class AddMealInitial extends AddMealState {}

final class AddMealSuccess extends AddMealState {}

final class AddMealLoading extends AddMealState {}

final class AddMealFailure extends AddMealState {
  final String errMessage;
  AddMealFailure(this.errMessage);
}
