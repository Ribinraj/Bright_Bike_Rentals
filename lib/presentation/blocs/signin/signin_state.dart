part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoadingState extends SigninState {}

final class SigninSuccessState extends SigninState {
  final String message;

  SigninSuccessState({required this.message});
}

final class SigninErrorState extends SigninState {
  final String message;

  SigninErrorState({required this.message});
}
