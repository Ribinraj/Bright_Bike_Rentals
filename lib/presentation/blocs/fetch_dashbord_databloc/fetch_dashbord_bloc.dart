import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/data/dashbord_datamodel.dart';
import 'package:bright_bike_rentals/domain/repositories/dashbordrepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'fetch_dashbord_event.dart';
part 'fetch_dashbord_state.dart';

class FetchDashbordBloc extends Bloc<FetchDashbordEvent, FetchDashbordState> {
  FetchDashbordBloc() : super(FetchDashbordInitial()) {
    on<FetchDashbordEvent>((event, emit) {});
    on<FetchDashbordDataInitialEvent>(fetchdashborddataevent);
  }

  FutureOr<void> fetchdashborddataevent(FetchDashbordDataInitialEvent event,
      Emitter<FetchDashbordState> emit) async {
    emit(FetchDashbordDataLoadingState());
    final Response response = await Dashbordrepo.fetchdashborddata();
    final responsedata = jsonDecode(response.body);
    if (responsedata["status"] == 200) {
      final jsonData = responsedata['data'];
      final dashbordData = DashboardDataMOdel.fromJson(jsonData);
      emit(FetchDashbordDataSuccessState(dashborddata: dashbordData));
    } else {
      String message = responsedata['message'];
      emit(FetchDashbordDataErrorState(message: message));
    }
  }
}
