import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/domain/repositories/signinrepo.dart';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'password_login_event.dart';
part 'password_login_state.dart';

class PasswordLoginBloc extends Bloc<PasswordLoginEvent, PasswordLoginState> {
  PasswordLoginBloc() : super(PasswordLoginInitial()) {
    on<PasswordLoginEvent>((event, emit) {});
    on<LoginbuttonClickevent>(loginevent);
  }

  FutureOr<void> loginevent(
      LoginbuttonClickevent event, Emitter<PasswordLoginState> emit) async {
    emit(PasswordLoginLoadingState());
    final Response response = await SigninRepo.passwordlogin(
        mobilenumber: event.mobilenumber, password: event.password);
    final responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        preferences.setString('USER_TOKEN', responsedata["data"]["token"]);
      emit(PasswordLoginSuccessState());
    } else if (responsedata["error"] == true) {
      String message = responsedata["messages"];
      emit(PassWordLoginErrorState(message: message));
    }
  }
}
