import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bright_bike_rentals/data/policy_model.dart';
import 'package:bright_bike_rentals/domain/repositories/Policyrepo.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  PrivacyPolicyBloc() : super(PrivacyPolicyInitial()) {
    on<PrivacyPolicyEvent>((event, emit) {});
    on<PrivacyPolicyInitialFetchingEvent>(privacypolicyevent);
  }

  FutureOr<void> privacypolicyevent(PrivacyPolicyInitialFetchingEvent event,
      Emitter<PrivacyPolicyState> emit) async {
    emit(PrivacyPolicyLoadingState());
    final Response response = await Policyrepo.fetchpolicydata();
    final responsedata = jsonDecode(response.body);
    if (responsedata['status'] == 200) {
      final  policies = responsedata['data'];
     final policydata = PolicyModel.fromJsonList(policies);
      emit(PrivacyPolicySuccessState(policy:policydata));
    } else if (responsedata['error'] == true) {
      final String message = responsedata['message'];
      emit(PrivacyPolicyErrorState(message: message));
    }
  }
}
//////

