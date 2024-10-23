part of 'fetch_profile_bloc.dart';

@immutable
sealed class FetchProfileState {}

final class FetchProfileInitial extends FetchProfileState {}

final class FetchProfileDataSuccessState extends FetchProfileState {
  final CustomerProfileModel customerData;

  FetchProfileDataSuccessState({required this.customerData});
}

final class FetchProfileDataLoadingState extends FetchProfileState {}

final class FetchprofileDataErrorState extends FetchProfileState {
  final String message;

  FetchprofileDataErrorState({required this.message});

 
}
