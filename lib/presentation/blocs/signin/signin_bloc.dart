import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/domain/repositories/signinrepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {});
    on<GetstartedButtenclickevent>(signinevent);
  }

  FutureOr<void> signinevent(
      GetstartedButtenclickevent event, Emitter<SigninState> emit) async {
    emit(SigninLoadingState());
    final Response response =
        await SigninRepo.numbercheck(mobilenumber: event.mobilenumber);
    final responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
      String message = responsedata["messages"];
      emit(SigninSuccessState(message: message));
    } else if(responsedata[ "error"]==true) {
      String message=responsedata["messages"];
      emit(SigninErrorState(message: message));
    }
  }
}
