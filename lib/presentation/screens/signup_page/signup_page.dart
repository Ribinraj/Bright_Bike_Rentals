import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class ScreenSignUppage extends StatefulWidget {
  const ScreenSignUppage({super.key});

  @override
  State<ScreenSignUppage> createState() => _ScreenSignUppageState();
}

class _ScreenSignUppageState extends State<ScreenSignUppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        padding:EdgeInsets.all(ResponsiveUtils.wp(5)) ,
        children: [
            ResponsiveSizedBox.height50,
            SizedBox(
              width: ResponsiveUtils.wp(40),
              height: ResponsiveUtils.hp(20),
              child: Image.asset(
                AppImages.logo,
                fit: BoxFit.contain,
              ),
            )
        ],
      ) ,
    );
  }
}
