part of 'bottom_navigationbar_bloc.dart';

@immutable
abstract class BottomNavigationbarState {
  final int currentPageIndex;
  
  const BottomNavigationbarState({required this.currentPageIndex});
}

class BottomNavigationbarInitial extends BottomNavigationbarState {
  const BottomNavigationbarInitial() : super(currentPageIndex: 0);
}

class NavigationState extends BottomNavigationbarState {
  const NavigationState({required super.currentPageIndex});
}