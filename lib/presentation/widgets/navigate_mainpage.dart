import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void navigateToMainPage(BuildContext context, int pageIndex) {
  // Navigate to ScreenMainPage
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => ScreenMainPage()),
  );

  // After navigation, update the BLoC to show the desired page
  BlocProvider.of<BottomNavigationbarBloc>(context).add(
    NavigateToPageEvent(pageIndex: pageIndex),
  );
}