part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<SearchResultModel> searchResultList;
  SearchSuccessState(this.searchResultList);
}


final class SearchLoadingState extends SearchState {}

final class SearchFalureState extends SearchState {
  final String errMessage;
  SearchFalureState(this.errMessage);
}
