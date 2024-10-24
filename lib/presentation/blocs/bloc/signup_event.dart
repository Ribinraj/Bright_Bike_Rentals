part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class SignupButtonClickingEvent extends SignupEvent {
  final String username;
  final String mobilenumber;
  final String password;
  final String confirmpassword;

  SignupButtonClickingEvent({required this.username, required this.mobilenumber, required this.password, required this.confirmpassword});
}
