import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  bool _wasConnected = true;

  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<CheckConnectivity>(_onCheckConnectivity);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) {
      add(CheckConnectivity());
    });
  }

  Future<void> _onCheckConnectivity(CheckConnectivity event, Emitter<ConnectivityState> emit) async {
    try {
      final results = await _connectivity.checkConnectivity();
      if (results.contains(ConnectivityResult.none) && results.length == 1) {
        _wasConnected = false;
        emit(ConnectivityFailure());
      } else {
        if (!_wasConnected) {
          emit(ConnectivityRestored(results));
        } else {
          emit(ConnectivitySuccess(results));
        }
        _wasConnected = true;
      }
    } catch (_) {
      _wasConnected = false;
      emit(ConnectivityFailure());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}