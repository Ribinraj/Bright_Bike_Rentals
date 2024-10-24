import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/data/settings_model.dart';
import 'package:bright_bike_rentals/domain/repositories/settingsrepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_bloc_event.dart';
part 'settings_bloc_state.dart';

class SettingsBlocBloc extends Bloc<SettingsBlocEvent, SettingsBlocState> {
  SettingsBlocBloc() : super(SettingsBlocInitial()) {
    on<SettingsBlocEvent>((event, emit) {});
    on<SettingsDataInitialFetchingEvent>(settingsfetchingevent);
  }

  FutureOr<void> settingsfetchingevent(SettingsDataInitialFetchingEvent event,
      Emitter<SettingsBlocState> emit) async {
    emit(SettingsFetchingLoadingState());
    final Response response = await SettingsRepo.fetchsettingsdata();
    final responsedata = jsonDecode(response.body);
    if (responsedata['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setBool('LOGIN', true);
      preferences.setString(
          'BUSINESSPHONENUMBER', responsedata["data"]["businessPhoneNumber"]);
      final settingsdata = SettingsDataModel.fromJson(responsedata['data']);
      emit(SettingsFetchingSuccessState(settingsdata: settingsdata));
    } else {
      log('else work');
    }
  }
}
