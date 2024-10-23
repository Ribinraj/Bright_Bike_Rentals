part of 'settings_bloc_bloc.dart';

@immutable
sealed class SettingsBlocState {}

final class SettingsBlocInitial extends SettingsBlocState {}

final class SettingsFetchingLoadingState extends SettingsBlocState {}

final class SettingsFetchingSuccessState extends SettingsBlocState {
  final SettingsDataModel settingsdata;

  SettingsFetchingSuccessState({required this.settingsdata});
}

final class SettingsFetchingErrorState extends SettingsBlocState {
  final String message;

  SettingsFetchingErrorState({required this.message});
}
