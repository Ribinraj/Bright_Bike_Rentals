import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/signin_page/siginin_page.dart';
import 'package:bright_bike_rentals/presentation/widgets/custombackbuttonappbar.dart';

import 'package:flutter/material.dart';

class ScreenGustorSigninPage extends StatefulWidget {
  const ScreenGustorSigninPage({super.key});

  @override
  State<ScreenGustorSigninPage> createState() => _ScreenGustorSigninPageState();
}

class _ScreenGustorSigninPageState extends State<ScreenGustorSigninPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBackbuttonAppbar(),
        body: Container(
            child: ListView(
                padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
                children: [
              SizedBox(
                height: ResponsiveUtils.hp(15),
              ),
              SizedBox(
                width: ResponsiveUtils.wp(45),
                height: ResponsiveUtils.hp(25),
                child: Image.asset(
                  Appconstants.logo,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: ResponsiveUtils.hp(15),
              ),
              Container(
                height: ResponsiveUtils.hp(7),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Appcolors.kblackColor,
                    borderRadius: BorderRadius.circular(6),
                    border:
                        Border.all(width: 1.5, color: Appcolors.kwhiteColor)),
                child: Center(
                  child: TextStyles.body(
                      text: 'Checkout as a guest',
                      color: Appcolors.kwhiteColor),
                ),
              ),
              ResponsiveSizedBox.height20,
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Appcolors.kblackColor,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Appcolors.kblackColor,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              ResponsiveSizedBox.height20,
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenSigninPage()));
                },
                child: Container(
                  height: ResponsiveUtils.hp(7),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Appcolors.kyellowColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(width: 1.5, color: Appcolors.kwhiteColor)),
                  child: Center(
                    child: TextStyles.body(
                      text: 'Login',
                    ),
                  ),
                ),
              ),
            ])));
  }
}
