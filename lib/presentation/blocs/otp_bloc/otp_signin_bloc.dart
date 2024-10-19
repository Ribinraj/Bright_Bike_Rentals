import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/domain/repositories/signinrepo.dart';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'otp_signin_event.dart';
part 'otp_signin_state.dart';

class OtpSigninBloc extends Bloc<OtpSigninEvent, OtpSigninState> {
  OtpSigninBloc() : super(OtpSigninInitial()) {
    on<OtpSigninEvent>((event, emit) {});
    on<SendOtpclickEvent>(sendotpevent);
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
      String message = responsedata["messages"];
      emit(OtpSigninErrorState(message: message));
    }
  }
}
