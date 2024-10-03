import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';
import 'package:bright_bike_rentals/presentation/screens/signin_page/siginin_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveUtils().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bright Bike Rentals',
      theme: ThemeData(
        fontFamily: 'Helvetica',
        useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Appcolors.kblackColor,
        ),
      ),
      home: ScreenMainPage(),
    );
  }
}
