import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:bright_bike_rentals/presentation/widgets/dash_devider.dart';
import 'package:flutter/material.dart';

class ScreenSigninPage extends StatefulWidget {
  const ScreenSigninPage({super.key});

  @override
  State<ScreenSigninPage> createState() => _ScreenSigninPageState();
}

class _ScreenSigninPageState extends State<ScreenSigninPage> {
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Appcolors.kyellowColor, Appcolors.kwhiteColor],
          ),
        ),
        child: ListView(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ResponsiveSizedBox.height20,
                const ResponsiveText(
                  'Self Ride\nBikes',
                  sizeFactor: 2.5,
                  weight: FontWeight.bold,
                ),
                TextStyles.subheadline(
                    text: 'Book bikes at flexible prices',
                    weight: FontWeight.bold),
                ResponsiveSizedBox.height50,
                CustomTextfield(
                    controller: phonenumberController,
                    labelText: 'Enter Mobile Number'),
                ResponsiveSizedBox.height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: ResponsiveUtils.wp(40),
                      child: const Divider(
                        color: Appcolors.kblackColor,
                      ),
                    ),
                    TextStyles.body(text: 'or'),
                    SizedBox(
                        width: ResponsiveUtils.wp(40),
                        child: const Divider(
                          color: Appcolors.kblackColor,
                        )),
                  ],
                ),
                ResponsiveSizedBox.height20,
                CustomTextfield(
                    controller: usernameController,
                    labelText: 'Enter Username'),
                ResponsiveSizedBox.height20,
                CustomTextfield(
                    controller: passwordController,
                    labelText: 'Enter Password'),
                ResponsiveSizedBox.height50,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusStyles.kradius10(),
                        ),
                        backgroundColor: Appcolors.kyellowColor),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Appcolors.kblackColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
