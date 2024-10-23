part of 'fetch_dashbord_bloc.dart';

@immutable
sealed class FetchDashbordEvent {}
final class FetchDashbordDataInitialEvent extends FetchDashbordEvent{}