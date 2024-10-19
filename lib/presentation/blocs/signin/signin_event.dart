part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

final class GetstartedButtenclickevent extends SigninEvent {
  final String mobilenumber;

  GetstartedButtenclickevent({required this.mobilenumber});
}
