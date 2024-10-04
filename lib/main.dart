import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUtils().init(context);
    return BlocProvider(
      create: (context) => BottomNavigationbarBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bright Bike Rentals',
        theme: ThemeData(
          fontFamily: 'Helvetica',
          useMaterial3: true,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Appcolors.kblackColor,
          ),
        ),
        home:ScreenMainPage(),
      ),
    );
  }
}
