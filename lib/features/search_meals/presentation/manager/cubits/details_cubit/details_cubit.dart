import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/details_model.dart';
import 'package:meal_tracking_app/features/search_meals/data/services/search_service.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  DetailsModel? detailsModel;
  getDetails({required String mealName}) async {
    emit(DetailsLoadingState());
    try {
      detailsModel = await SearchService(Dio()).getDetails(mealName: mealName);
      if (detailsModel == null) {
        emit(DetailsFalureState("Meal details not found"));
      } else {
        emit(DetailsSuccessState());
      }
    } catch (e) {
      emit(DetailsFalureState(e.toString()));
    }
  }
}
