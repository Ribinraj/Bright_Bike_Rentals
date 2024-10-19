part of 'password_login_bloc.dart';

@immutable
sealed class PasswordLoginState {}

final class PasswordLoginInitial extends PasswordLoginState {}

final class PasswordLoginLoadingState extends PasswordLoginState {}

final class PasswordLoginSuccessState extends PasswordLoginState {}

final class PassWordLoginErrorState extends PasswordLoginState {
  final String message;

  PassWordLoginErrorState({required this.message});
}
