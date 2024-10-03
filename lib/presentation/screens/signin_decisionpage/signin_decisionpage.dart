import 'dart:ui';

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/otp_page/otp_page.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_textfield.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class ScreenSignIndecisionPage extends StatefulWidget {
  const ScreenSignIndecisionPage({super.key});

  @override
  State<ScreenSignIndecisionPage> createState() =>
      _ScreenSignIndecisionPageState();
}

class _ScreenSignIndecisionPageState extends State<ScreenSignIndecisionPage> {
  final TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
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
          key: formkey,
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
                        InkWell(
                          onTap: () {
                            navigatePush(context, ScreenOtpPage());
                          },
                          child: const ResponsiveText(
                            'OTP',
                            sizeFactor: .8,
                            weight: FontWeight.bold,
                            color: Appcolors.kredColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  ResponsiveSizedBox.height50,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        child: Text(
                          'SignIn',
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