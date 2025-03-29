import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meal_tracking_app/features/search_meals/data/models/search_result_model.dart';
import 'package:meal_tracking_app/features/search_meals/data/services/search_service.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  List<SearchResultModel>? searchResultList;

  getSearchResult({required String searchWord}) async {
    emit(SearchLoadingState());
    try {
      searchResultList =
          await SearchService(Dio()).getSearchedMeals(searchWord: searchWord);
      emit(SearchSuccessState(searchResultList!));
    } catch (e) {
      emit(SearchFalureState(e.toString()));
    }
  }
}
