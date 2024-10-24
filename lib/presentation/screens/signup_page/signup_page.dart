

import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/bloc/signup_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/signin_decisionpage/signin_decisionpage.dart';
import 'package:bright_bike_rentals/presentation/screens/signup_page/widgets/customreadonly_textfield.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenSignUppage extends StatefulWidget {
  final String mobilenumber;
  const ScreenSignUppage({super.key, required this.mobilenumber});

  @override
  State<ScreenSignUppage> createState() => _ScreenSignUppageState();
}

class _ScreenSignUppageState extends State<ScreenSignUppage> {
  final TextEditingController userNamecontroller = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  // final TextEditingController emailAdressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileNumberController.text = widget.mobilenumber;
  }
    @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    userNamecontroller.dispose();
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signupbloc = context.read<SignupBloc>();
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
              CustomReadOnlyTextField(controller:mobileNumberController, labelText:'Mobile Number'),
            
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
              // CustomTextfield(
              //     validator: validateEmail,
              //     controller: emailAdressController,
              //     labelText: 'Enter EmailAdress'),
              // ResponsiveSizedBox.height20,
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
                child: BlocConsumer<SignupBloc, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccessState) {
                      MaterialPageRoute(
                        builder: (context) => ScreenSignIndecisionPage(
                          mobilenumber: widget.mobilenumber,
                        ),
                      );
                    } else if (state is SignupErrorState) {
                      CustomSnackBar.show(
                          context: context,
                          title: 'Error!',
                          message: state.message,
                          contentType: ContentType.failure);
                    }
                  },
                  builder: (context, state) {
                    if (state is SignupLoadingState) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyles.kradius10(),
                              ),
                              backgroundColor: Appcolors.kyellowColor),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: Center(
                                child: LoadingAnimationWidget.staggeredDotsWave(
                                    color: Appcolors.kblackColor, size: 30),
                              )),
                        ),
                      );
                    }
                    return ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          signupbloc.add(SignupButtonClickingEvent(
                              username: userNamecontroller.text,
                              mobilenumber: widget.mobilenumber,
                              password: passwordController.text,
                              confirmpassword: confirmPasswordController.text));
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
                          'SignUp',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Appcolors.kblackColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
