part of 'fetch_dashbord_bloc.dart';

@immutable
sealed class FetchDashbordState {}

final class FetchDashbordInitial extends FetchDashbordState {}

final class FetchDashbordDataLoadingState extends FetchDashbordState {}

final class FetchDashbordDataSuccessState extends FetchDashbordState {
  final DashboardDataMOdel dashborddata;

  FetchDashbordDataSuccessState({required this.dashborddata});
}

final class FetchDashbordDataErrorState extends FetchDashbordState {
  final String message;

  FetchDashbordDataErrorState({required this.message});
}
