part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class DetailsSuccessState extends DetailsState {}

final class DetailsLoadingState extends DetailsState {}

final class DetailsFalureState extends DetailsState {
  final errMessage;
  DetailsFalureState(this.errMessage);
}
