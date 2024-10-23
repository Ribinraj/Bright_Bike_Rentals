import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/data/profile_model.dart';
import 'package:bright_bike_rentals/domain/repositories/profilerepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'fetch_profile_event.dart';
part 'fetch_profile_state.dart';

class FetchProfileBloc extends Bloc<FetchProfileEvent, FetchProfileState> {
  FetchProfileBloc() : super(FetchProfileInitial()) {
    on<FetchProfileEvent>((event, emit) {});
    on<FetchprofiledataInitialEvent>(fetchprofileEvent);
  }

  FutureOr<void> fetchprofileEvent(FetchprofiledataInitialEvent event,
      Emitter<FetchProfileState> emit) async {
    emit(FetchProfileDataLoadingState());
    final Response response = await Profilerepo.fetchprofiledata();
    final responsedata = jsonDecode(response.body);
    if (responsedata['status'] == 200) {
      final customerProfiledata =
          CustomerProfileModel.fromJson(responsedata['data']);
      emit(FetchProfileDataSuccessState(customerData: customerProfiledata));
    } else {
      final String message = responsedata['message'];
      emit(FetchprofileDataErrorState(message: message));
    }
  }
}
