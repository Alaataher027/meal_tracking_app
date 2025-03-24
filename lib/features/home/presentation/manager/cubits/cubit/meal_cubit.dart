import 'package:bloc/bloc.dart';
import 'package:meal_tracking_app/features/home/data/models/meal_model.dart';
import 'package:meta/meta.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
}
