part of 'password_login_bloc.dart';

@immutable
sealed class PasswordLoginEvent {}

final class LoginbuttonClickevent extends PasswordLoginEvent{
  final String mobilenumber;
  final String password;

  LoginbuttonClickevent({required this.mobilenumber, required this.password});
}
