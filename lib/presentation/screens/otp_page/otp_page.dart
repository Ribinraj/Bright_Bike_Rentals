import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/otp_bloc/otp_signin_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_snackbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class ScreenOtpPage extends StatefulWidget {
  final String customerid;
  final String mobilenumber;
  const ScreenOtpPage(
      {super.key, required this.customerid, required this.mobilenumber});

  @override
  State<ScreenOtpPage> createState() => _ScreenOtpPageState();
}

class _ScreenOtpPageState extends State<ScreenOtpPage> {
  // Create 6 controllers for OTP fields
  final List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  // Create 6 focus nodes for OTP fields
  final List<FocusNode> focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  Timer? _timer;
  int _secondsRemaining = 30;
  bool _isTimerActive = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    _secondsRemaining = 30;
    _isTimerActive = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _isTimerActive = false;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final otpsigninbloc = context.read<OtpSigninBloc>();
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
                // OTP Input Fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    6,
                    (index) => SizedBox(
                      width: ResponsiveUtils.wp(13),
                      height: ResponsiveUtils.wp(13),
                      child: TextFormField(
                        controller: otpControllers[index],
                        focusNode: focusNodes[index],
                        onChanged: (value) {
                          if (value.length == 1 && index < 5) {
                            focusNodes[index + 1].requestFocus();
                          } else if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                        },
                        style: TextStyle(
                          fontSize: ResponsiveUtils.wp(5),
                          fontWeight: FontWeight.bold,
                          color: Appcolors.kblackColor,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadiusStyles.kradius10(),
                            borderSide: const BorderSide(
                              color: Appcolors.kblackColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadiusStyles.kradius10(),
                            borderSide: const BorderSide(
                              color: Appcolors.kblackColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadiusStyles.kradius10(),
                            borderSide: const BorderSide(
                              color: Appcolors.kyellowColor,
                              width: 1,
                            ),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (_isTimerActive)
                        Row(
                          children: [
                            TextStyles.caption(
                                text: 'Time remaining ',
                                color: Appcolors.kgreenColor,
                                weight: FontWeight.w600),
                            TextStyles.caption(
                              text:
                                  '00:${_secondsRemaining.toString().padLeft(2, '0')}',
                              color: Appcolors.kredColor,
                              weight: FontWeight.w600,
                            ),
                          ],
                        ),
                      if (!_isTimerActive)
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
                           
                            return GestureDetector(
                              onTap: () {
                                startTimer();
                                otpsigninbloc.add(SendOtpclickEvent(
                                    mobilenumber: widget.mobilenumber));
                              },
                              child: TextStyles.caption(
                                text: 'Resend OTP',
                                color: Appcolors.kredColor,
                                weight: FontWeight.w600,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
                ResponsiveSizedBox.height50,
                SizedBox(
                  width: double.infinity,
                  child: BlocConsumer<OtpSigninBloc, OtpSigninState>(
                    listener: (context, state) {
                      if (state is VerifyOtpSuccessState) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenMainPage()));
                      }
                      if (state is VerifyOtpErrorState) {
                        CustomSnackBar.show(
                            context: context,
                            title: 'Error!',
                            message: state.message,
                            contentType: ContentType.failure);
                      }
                    },
                    builder: (context, state) {
                      if (state is OtpSigninLoadingState) {
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
                      return ElevatedButton(
                        onPressed: () {
                          // Get OTP value
                          String otp = otpControllers
                              .map((controller) => controller.text)
                              .join();
                          if (otp.length == 6) {
                            otpsigninbloc.add(VrifyOtpclickEvent(
                                otp: otp, customerid: widget.customerid));
                          } else {
                            CustomSnackBar.show(
                                context: context,
                                title: 'Error!',
                                message: 'Please Enter valid otp',
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
                            'Get Started',
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
    );
  }
}
