import 'dart:ui';

import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/otp_bloc/otp_signin_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/password_login_blod.dart/password_login_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';
import 'package:bright_bike_rentals/presentation/screens/otp_page/otp_page.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class ScreenSignIndecisionPage extends StatefulWidget {
  final String mobilenumber;
  const ScreenSignIndecisionPage({super.key, required this.mobilenumber});

  @override
  State<ScreenSignIndecisionPage> createState() =>
      _ScreenSignIndecisionPageState();
}

class _ScreenSignIndecisionPageState extends State<ScreenSignIndecisionPage> {
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final passwordbloc = context.read<PasswordLoginBloc>();
    final otpbloc = context.read<OtpSigninBloc>();
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
          key: formkey,
          child: ListView(
            padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
            children: [
              ResponsiveSizedBox.height50,
              SizedBox(
                width: ResponsiveUtils.wp(60),
                height: ResponsiveUtils.hp(30),
                child: Image.asset(
                  Appconstants.logo,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                      controller: passwordController,
                      labelText: 'Enter Password'),
                  Padding(
                    padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextStyles.caption(
                            text: 'or Login with ',
                            color: Appcolors.kblackColor,
                            weight: FontWeight.w600),
                        BlocConsumer<OtpSigninBloc, OtpSigninState>(
                          listener: (context, state) {
                            if (state is OtpSigninLoadingState) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                // ignore: deprecated_member_use
                                builder: (context) => WillPopScope(
                                  onWillPop: () async =>
                                      false, // Prevents back button dismiss
                                  child: Scaffold(
                                    backgroundColor:
                                        Colors.white, // White background
                                    body: Center(
                                      child: Lottie.asset(
                                        loadinganimation,
                                       
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              Navigator.of(context).pop();

                              if (state is OtpSigninSuccessState) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           ScreenOtpPage(customerid:state.customerid,mobilenumber: widget.mobilenumber,)),
                                );
                              } else if (state is OtpSigninErrorState) {
                                CustomSnackBar.show(
                                    context: context,
                                    title: 'Error!',
                                    message: state.message,
                                    contentType: ContentType.failure);
                              }
                            }
                          },
                          builder: (context, state) {
                            return InkWell(
                              onTap: () {
                                otpbloc.add(SendOtpclickEvent(
                                    mobilenumber: widget.mobilenumber));
                              },
                              child: const ResponsiveText(
                                'OTP',
                                sizeFactor: .8,
                                weight: FontWeight.bold,
                                color: Appcolors.kredColor,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  ResponsiveSizedBox.height50,
                  SizedBox(
                    width: double.infinity,
                    child: BlocConsumer<PasswordLoginBloc, PasswordLoginState>(
                      listener: (context, state) {
                        if (state is PasswordLoginSuccessState) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScreenMainPage()),
                          );
                        } else if (state is PassWordLoginErrorState) {
                          CustomSnackBar.show(
                              context: context,
                              title: 'Error!',
                              message: state.message,
                              contentType: ContentType.failure);
                        }
                      },
                      builder: (context, state) {
                        if (state is PasswordLoginLoadingState) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusStyles.kradius10(),
                                  ),
                                  backgroundColor: Appcolors.kyellowColor),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  child: Center(
                                    child: LoadingAnimationWidget
                                        .staggeredDotsWave(
                                            color: Appcolors.kblackColor,
                                            size: 30),
                                  )),
                            ),
                          );
                        }
                        return ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              passwordbloc.add(LoginbuttonClickevent(
                                  mobilenumber: widget.mobilenumber,
                                  password: passwordController.text));
                            } else {
                              CustomSnackBar.show(
                                  context: context,
                                  title: 'Error!!',
                                  message: 'Enter password',
                                  contentType: ContentType.failure);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusStyles.kradius10(),
                              ),
                              backgroundColor: Appcolors.kyellowColor),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child: Text(
                              'SignIn',
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
            ],
          ),
        ),
      ),
    );
  }
}
// body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 'assets/images/bicycle-wheel-against-sky-sunset.jpg'), // Correct way to use asset image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
//           child: Column(
//             children: [
//               ResponsiveSizedBox.height50,
//               SizedBox(
//                 width: ResponsiveUtils.wp(40),
//                 height: ResponsiveUtils.hp(20),
//                 child: Image.asset(
//                   AppImages.logo,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(
//                 height: ResponsiveUtils.hp(40),
//               ),
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadiusStyles.kradius10(),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                       child: Container(
//                         padding: EdgeInsets.all(ResponsiveUtils.wp(3)),
//                         width: ResponsiveUtils.wp(35),
//                         height: ResponsiveUtils.hp(20),
//                         decoration: BoxDecoration(
//                           color: Appcolors.kwhiteColor.withOpacity(0.2),
//                           borderRadius: BorderRadiusStyles.kradius10(),
//                           border: Border.all(
//                               color: Appcolors.kyellowColor.withOpacity(.6),
//                               width: 1.5),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextStyles.body(
//                                   text: 'Login With\nOTP',
//                                   color: Appcolors.kwhiteColor,
//                                   weight: FontWeight.w600,
//                                 ),
//                               ],
//                             ),
//                             const Spacer(),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Image.asset(
//                                   'assets/icons/business-and-finance (1).png',
//                                   width: ResponsiveUtils.wp(15),
//                                   height: ResponsiveUtils.hp(7),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   // Second Container (yellow blur)
//                   ClipRRect(
//                     borderRadius: BorderRadiusStyles.kradius10(),
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                       child: Container(
//                         padding: EdgeInsets.all(ResponsiveUtils.wp(3)),
//                         width: ResponsiveUtils.wp(35),
//                         height: ResponsiveUtils.hp(20),
//                         decoration: BoxDecoration(
//                           color: Appcolors.kwhiteColor.withOpacity(0.2),
//                           borderRadius: BorderRadiusStyles.kradius10(),
//                           border: Border.all(
//                               color: Appcolors.kyellowColor.withOpacity(.6),
//                               width: 1.5),
//                         ),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 TextStyles.body(
//                                   text: 'Login With\nPassword',
//                                   color: Appcolors.kwhiteColor,
//                                   weight: FontWeight.w600,
//                                 ),
//                               ],
//                             ),
//                             Spacer(),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Image.asset(
//                                   'assets/icons/padlock.png',
//                                   width: ResponsiveUtils.wp(15),
//                                   height: ResponsiveUtils.hp(7),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),