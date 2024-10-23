

import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_validators.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
class ScreenSignUppage extends StatefulWidget {
  const ScreenSignUppage({super.key});

  @override
  State<ScreenSignUppage> createState() => _ScreenSignUppageState();
}

class _ScreenSignUppageState extends State<ScreenSignUppage> {
  final TextEditingController userNamecontroller = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailAdressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
          child: ListView(
            padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
            children: [
              ResponsiveSizedBox.height50,
              SizedBox(
                width: ResponsiveUtils.wp(50),
                height: ResponsiveUtils.hp(25),
                child: Image.asset(
                  Appconstants.logo,
                  fit: BoxFit.contain,
                ),
              ),
              ResponsiveSizedBox.height50,
              CustomTextfield(
                  controller: mobileNumberController,
                  labelText: 'Mobile Number'),
              ResponsiveSizedBox.height20,
              CustomTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Username cannot be empty';
                    }
                    return null;
                  },
                  controller: userNamecontroller,
                  labelText: 'Enter Username'),
              ResponsiveSizedBox.height20,
              CustomTextfield(
                  validator: validateEmail,
                  controller: emailAdressController,
                  labelText: 'Enter EmailAdress'),
              ResponsiveSizedBox.height20,
              CustomTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
                  controller: passwordController,
                  labelText: 'Enter Password'),
              ResponsiveSizedBox.height20,
              CustomTextfield(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter the password';
                    }
                    if (value != passwordController.text) {
                      return 'Password do not match';
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  labelText: 'Re Enter Password'),
              ResponsiveSizedBox.height30,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
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
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text(
                      'SignUp',
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
        ),
      ),
    );
  }
}
