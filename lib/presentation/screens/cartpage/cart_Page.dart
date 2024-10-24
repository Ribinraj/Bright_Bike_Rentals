import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/Checkout_page/checkout_page.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/cart_titlewidget.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/payment_iconbutton.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/tick_iconbutton.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/top_container.dart';
import 'package:bright_bike_rentals/presentation/screens/gust_signinpage/gust_signinpage.dart';
import 'package:bright_bike_rentals/presentation/screens/payment_failiurepage/payment_failiure.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:bright_bike_rentals/presentation/widgets/dash_devider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenCartpage extends StatefulWidget {
  const ScreenCartpage({super.key});

  @override
  State<ScreenCartpage> createState() => _ScreenCartpageState();
}

class _ScreenCartpageState extends State<ScreenCartpage> {
  bool isButton1Clicked = false;
  bool isButton2Clicked = false;
  bool isButtonclicked = false;
  int selectedButtonIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
        child: Column(
          children: [
            const CartWidget(),
            ResponsiveSizedBox.height10,
            const Topcontainer(),
            ResponsiveSizedBox.height20,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.kbackgroundgrey,
                borderRadius: BorderRadiusStyles.kradius20(),
              ),
              child: Padding(
                padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveSizedBox.height10,
                    TextStyles.subheadline(
                      text: 'Payment Options',
                    ),
                    ResponsiveSizedBox.height10,
                    Row(
                      children: [
                        PaymentIconButton(
                          isClicked: selectedButtonIndex == 0,
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex =
                                  // (selectedButtonIndex == 0) ? -1 : 0;
                                  selectedButtonIndex = 0;
                            });
                          },
                        ),
                        ResponsiveSizedBox.width10,
                        TextStyles.body(
                          text: 'Full payment',
                        ),
                        const Spacer(),
                        TextStyles.body(
                          text: '\u20B9 2200.00',
                        )
                      ],
                    ),
                    ResponsiveSizedBox.height10,
                    Row(
                      children: [
                        PaymentIconButton(
                          isClicked: selectedButtonIndex == 1,
                          onPressed: () {
                            setState(() {
                              selectedButtonIndex =
                                  //(selectedButtonIndex == 1) ? -1 : 1;
                                  selectedButtonIndex = 1;
                            });
                          },
                        ),
                        ResponsiveSizedBox.width10,
                        TextStyles.body(
                          text: 'Pay 20% Advance',
                        ),
                        const Spacer(),
                        TextStyles.body(
                          text: '\u20B9 440.00',
                        )
                      ],
                    ),
                    ResponsiveSizedBox.height20,
                    const DashedDivider(
                      height: 1,
                      color: Appcolors.kblackColor,
                      dashWidth: 5,
                      dashSpace: 3,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
                        child: const ResponsiveText(
                          'Rs.1000 refundable security deposit / bike \nto be paid while boarding the Bike / Scooter.',
                          sizeFactor: 0.9,
                        ),
                      ),
                    ),
                    const DashedDivider(
                      height: 1,
                      color: Appcolors.kblackColor,
                      dashWidth: 5,
                      dashSpace: 3,
                    ),
                    ResponsiveSizedBox.height10,
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(ResponsiveUtils.wp(3)),
                        child: Row(
                          children: [
                            TickIconButton(
                                isClicked: isButtonclicked,
                                onPressed: () {
                                  setState(() {
                                    isButtonclicked = !isButtonclicked;
                                  });
                                }),
                            ResponsiveSizedBox.width10,
                            const ResponsiveText(
                              'Early Morning Pickup will be charged at \n\u20B9200 / Bike',
                              sizeFactor: 0.9,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const DashedDivider(
                      height: 1,
                      color: Appcolors.kblackColor,
                      dashWidth: 5,
                      dashSpace: 3,
                    ),
                    ResponsiveSizedBox.height30,
                    GestureDetector(
                      onTap: () {
                        navigatePush(context, const PaymentFailurePage());
                      },
                      child: TextStyles.headline(
                        text: '\u20B9 2200',
                      ),
                    ),
                    ResponsiveSizedBox.height20,
                    SizedBox(
                      width: double.infinity,
                      height: ResponsiveUtils.sp(10),
                      child: ElevatedButton(
                        onPressed: () {
                          checkUserlogin(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.kyellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusStyles.kradius20(),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 8.0),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                              color: Appcolors.kblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkUserlogin(context) async {
    final preferences = await SharedPreferences.getInstance();
    final userLoggedin = preferences.get('LOGIN');
    if (userLoggedin == null || userLoggedin == false) {
      navigatePush(context, const ScreenGustorSigninPage());
    } else {
      navigatePush(context, ScreenCheckoutPage());
    }
  }
}
