import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/otp_page/otp_page.dart';

import 'package:bright_bike_rentals/presentation/screens/signup_page/signup_page.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          navigatePush(context, ScreenOtpPage());
                        } else {
                          CustomSnackBar.show(
                              context: context,
                              title: 'Failed !!',
                              message: 'please Enter valid mobilenumber',
                              contentType: ContentType.failure);
                        }
                      },
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
