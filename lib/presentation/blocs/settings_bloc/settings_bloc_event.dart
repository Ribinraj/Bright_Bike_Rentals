part of 'settings_bloc_bloc.dart';

@immutable
sealed class SettingsBlocEvent {}
final class SettingsDataInitialFetchingEvent extends SettingsBlocEvent{}