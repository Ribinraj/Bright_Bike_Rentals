
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';


import 'package:bright_bike_rentals/presentation/screens/signup_page/signup_page.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_validators.dart';

import 'package:flutter/material.dart';

class ScreenSigninPage extends StatefulWidget {
  const ScreenSigninPage({super.key});

  @override
  State<ScreenSigninPage> createState() => _ScreenSigninPageState();
}

class _ScreenSigninPageState extends State<ScreenSigninPage> {
  final TextEditingController phonenumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
            children: [
              ResponsiveSizedBox.height50,
              SizedBox(
                width: ResponsiveUtils.wp(60),
                height: ResponsiveUtils.hp(30),
                child: Image.asset(
                  AppImages.logo,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveSizedBox.height50,
                  const ResponsiveText(
                    'Self Ride\nBikes',
                    sizeFactor: 3,
                    weight: FontWeight.bold,
                  ),
                  TextStyles.headline(
                      text: 'Book bikes at flexible prices',
                      weight: FontWeight.bold),
                  ResponsiveSizedBox.height50,
                  CustomTextfield(
                      textInputType: TextInputType.number,
                      validator: validateMobileNumber,
                      controller: phonenumberController,
                      labelText: 'Enter Mobile Number'),
                  ResponsiveSizedBox.height50,
                  CustomElevatedButton(
                    onpress: () {},
                    text: 'Get Staeted',
                  ),
                  Padding(
                    padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextStyles.caption(
                            text: 'Dont have an account?',
                            color: Appcolors.kblackColor,
                            weight: FontWeight.w600),
                        InkWell(
                          onTap: () {
                            navigatePush(context, ScreenSignUppage());
                          },
                          child: const ResponsiveText(
                            'SignUp',
                            sizeFactor: .8,
                            weight: FontWeight.bold,
                            color: Appcolors.kredColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

