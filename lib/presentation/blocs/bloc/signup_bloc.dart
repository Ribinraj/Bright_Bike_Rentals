import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/domain/repositories/signinrepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<SignupButtonClickingEvent>(signupevent);
  }

  FutureOr<void> signupevent(
      SignupButtonClickingEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());
    final Response response = await SigninRepo.signup(
        mobilenumber: event.mobilenumber,
        username: event.username,
        password: event.password,
        confirmpassword: event.confirmpassword);
    final responsedata = jsonDecode(response.body);
    if (responsedata['status'] == 200) {
      emit(SignupSuccessState());
    } else {
      final String message = responsedata['messages'];
      emit(SignupErrorState(message: message));
    }
  }
}
