import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:alaa_taher/features/search_meals/data/models/details_model.dart';
import 'package:alaa_taher/features/search_meals/data/models/search_result_model.dart';
import 'package:alaa_taher/features/search_meals/data/services/meal_service.dart';
import 'package:alaa_taher/features/search_meals/presentation/view/detailes_view.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  List<SearchResultModel>? searchResultList;
  DetailsModel? detailsModel;
  List<SearchResultModel>? filterResultList;

  getSearchResult({required String searchWord}) async {
    emit(SearchLoadingState());
    try {
      searchResultList =
          await MealService(Dio()).getSearchedMeals(searchWord: searchWord);
      emit(SearchSuccessState(searchResultList!));
    } catch (e) {
      emit(SearchFalureState(e.toString()));
    }
  }

  getFilterResult({required String mealType}) async {
    emit(SearchLoadingState());
    try {
      filterResultList =
          await MealService(Dio()).filterMeals(mealType: mealType);
      emit(SearchSuccessState(filterResultList!));
    } catch (e) {
      emit(SearchFalureState(e.toString()));
    }
  }
}
