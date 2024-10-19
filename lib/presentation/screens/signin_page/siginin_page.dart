

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:bright_bike_rentals/presentation/blocs/signin/signin_bloc.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bright_bike_rentals/presentation/screens/signin_decisionpage/signin_decisionpage.dart';

import 'package:bright_bike_rentals/presentation/screens/signup_page/signup_page.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_validators.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    final signinbloc = context.read<SigninBloc>();
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
                  BlocConsumer<SigninBloc, SigninState>(
                    listener: (context, state) {
                      if (state is SigninSuccessState) {
                        if (state.message == "Existing Customer") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ScreenSignIndecisionPage(mobilenumber:phonenumberController.text,),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenSignUppage(),
                            ),
                          );
                        }
                      } else if (state is SigninErrorState) {
                        CustomSnackBar.show(
                            context: context,
                            title: 'Error!',
                            message: state.message,
                            contentType: ContentType.failure);
                      }
                    },
                    builder: (context, state) {
                      if (state is SigninLoadingState) {
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
                                  child:
                                      LoadingAnimationWidget.staggeredDotsWave(
                                          color: Appcolors.kblackColor,
                                          size: 30),
                                )),
                          ),
                        );
                      }
                      return CustomElevatedButton(
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            signinbloc.add(GetstartedButtenclickevent(
                                mobilenumber: phonenumberController.text));
                          } else {
                            CustomSnackBar.show(
                                context: context,
                                title: 'Error!',
                                message: 'Please Enter phonenumber',
                                contentType: ContentType.failure);
                          }
                        },
                        text: 'Get Started',
                      );
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       TextStyles.caption(
                  //           text: 'Dont have an account?',
                  //           color: Appcolors.kblackColor,
                  //           weight: FontWeight.w600),
                  //       InkWell(
                  //         onTap: () {
                  //           navigatePush(context, ScreenSignUppage());
                  //         },
                  //         child: const ResponsiveText(
                  //           'SignUp',
                  //           sizeFactor: .8,
                  //           weight: FontWeight.bold,
                  //           color: Appcolors.kredColor,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
