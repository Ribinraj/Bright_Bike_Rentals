import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/domain/repositories/signinrepo.dart';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'otp_signin_event.dart';
part 'otp_signin_state.dart';

class OtpSigninBloc extends Bloc<OtpSigninEvent, OtpSigninState> {
  OtpSigninBloc() : super(OtpSigninInitial()) {
    on<OtpSigninEvent>((event, emit) {});
    on<SendOtpclickEvent>(sendotpevent);
    on<VrifyOtpclickEvent>(veryfyotpevent);
  }

  FutureOr<void> sendotpevent(
      SendOtpclickEvent event, Emitter<OtpSigninState> emit) async {
    emit(OtpSigninLoadingState());
    final Response response =
        await SigninRepo.otplogin(mobilenumber: event.mobilenumber);
    final responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
    
      String customerid = responsedata["data"]["customerId"];
      emit(OtpSigninSuccessState(customerid: customerid));
    } else if (responsedata["error"] == true) {
      String message = responsedata["message"];
      emit(OtpSigninErrorState(message: message));
    }
  }

  FutureOr<void> veryfyotpevent(
      VrifyOtpclickEvent event, Emitter<OtpSigninState> emit) async {
    emit(OtpSigninLoadingState());
    final Response response = await SigninRepo.verifyotp(
        customerid: event.customerid, otp: event.otp);
    final responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        preferences.setString('USER_TOKEN', responsedata["data"]["token"]);
      emit(VerifyOtpSuccessState());
    } else if (responsedata["error"] == true) {
      String message = responsedata["message"];
      emit(VerifyOtpErrorState(message: message));
    }
  }
}
