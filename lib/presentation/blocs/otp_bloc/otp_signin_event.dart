part of 'otp_signin_bloc.dart';

@immutable
sealed class OtpSigninEvent {}

final class SendOtpclickEvent extends OtpSigninEvent {
  final String mobilenumber;

  SendOtpclickEvent({required this.mobilenumber});
}

final class VrifyOtpclickEvent extends OtpSigninEvent {
  final String otp;
  final String customerid;

  VrifyOtpclickEvent({required this.otp, required this.customerid});
}
