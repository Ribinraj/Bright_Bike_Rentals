

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/cart_titlewidget.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/payment_iconbutton.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/tick_iconbutton.dart';
import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/top_container.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/dash_devider.dart';
import 'package:flutter/material.dart';

class ScreenCartpage extends StatefulWidget {
  const ScreenCartpage({super.key});

  @override
  State<ScreenCartpage> createState() => _ScreenCartpageState();
}

class _ScreenCartpageState extends State<ScreenCartpage> {
  bool isButton1Clicked = false;
  bool isButton2Clicked = false;
  bool isButtonclicked = false;
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
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveSizedBox.height10,
                    const Text(
                      'Payment Options',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                    ResponsiveSizedBox.height10,
                    Row(
                      children: [
                        PaymentIconButton(
                            isClicked: isButton1Clicked,
                            onPressed: () {
                              setState(() {
                                isButton1Clicked = !isButton1Clicked;
                              });
                            }),
                        ResponsiveSizedBox.height10,
                        const Text(
                          'Full payment',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        const Text(
                          '\u20B9 2200.00',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    ResponsiveSizedBox.height10,
                    Row(
                      children: [
                        PaymentIconButton(
                            isClicked: isButton2Clicked,
                            onPressed: () {
                              setState(() {
                                isButton2Clicked = !isButton2Clicked;
                              });
                            }),
                        ResponsiveSizedBox.width10,
                        const Text(
                          'Pay 20% Advance',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        const Text(
                          '\u20B9 440.00',
                          style: TextStyle(fontSize: 15),
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
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'Rs.1000 refundable security deposit / bike \nto be paid while boarding the Bike / Scooter.'),
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
                        padding: const EdgeInsets.all(10),
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
                            const Text(
                                'Early Morning Pickup will be charged at \n\u20B9200 / Bike'),
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
                    const Text(
                      '\u20B9 2200',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ResponsiveSizedBox.height20,
                    SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
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
}
