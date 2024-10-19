part of 'otp_signin_bloc.dart';

@immutable
sealed class OtpSigninState {}

final class OtpSigninInitial extends OtpSigninState {}

final class OtpSigninLoadingState extends OtpSigninState {}

final class OtpSigninSuccessState extends OtpSigninState {
  final String customerid;

  OtpSigninSuccessState({required this.customerid});
}

final class OtpSigninErrorState extends OtpSigninState {
  final String message;

  OtpSigninErrorState({required this.message});
}
