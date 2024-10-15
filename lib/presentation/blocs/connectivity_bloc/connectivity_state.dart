part of 'connectivity_bloc.dart';

@immutable
sealed class ConnectivityState {}





class ConnectivityInitial extends ConnectivityState {}

class ConnectivitySuccess extends ConnectivityState {
  final List<ConnectivityResult> results;
  ConnectivitySuccess(this.results);
}

class ConnectivityFailure extends ConnectivityState {}

class ConnectivityRestored extends ConnectivityState {
  final List<ConnectivityResult> results;
  ConnectivityRestored(this.results);
}