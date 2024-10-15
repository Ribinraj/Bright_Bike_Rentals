import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_editing_textfield.dart';

import 'package:bright_bike_rentals/presentation/widgets/dash_devider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenCheckoutPage extends StatefulWidget {
  const ScreenCheckoutPage({super.key});

  @override
  State<ScreenCheckoutPage> createState() => _ScreenCheckoutPageState();
}

class _ScreenCheckoutPageState extends State<ScreenCheckoutPage> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kyellowColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kyellowColor,
        title: TextStyles.headline(text: 'Checkout'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              size: 35,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Appcolors.kwhiteColor),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            ResponsiveSizedBox.height20,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.kbackgroundgrey,
                borderRadius: BorderRadiusStyles.kradius20(),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Column(
                  children: [
                    CustomEditingTextField(
                        title: 'Rider Name',
                        icon: Icons.person,
                        controller: namecontroller,
                        hintText: 'Enter Name'),
                    ResponsiveSizedBox.height20,
                    CustomEditingTextField(
                      title: 'Rider Mobilenumber',
                      icon: Icons.phone,
                      controller: numbercontroller,
                      hintText: 'Enter Rider Mobilenumber',
                    )
                  ],
                ),
              ),
            ),
            ResponsiveSizedBox.height20,
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Appcolors.kbackgroundgrey,
                borderRadius: BorderRadiusStyles.kradius20(),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveSizedBox.height20,
                    const ResponsiveText(
                      'Payment Summery',
                      weight: FontWeight.bold,
                      sizeFactor: 1.2,
                    ),
                    ResponsiveSizedBox.height10,
                    const Row(
                      children: [
                        ResponsiveText(
                          'Order Total',
                          sizeFactor: 1.1,
                        ),
                        Spacer(),
                        ResponsiveText(
                          '\u20B9 2200.00',
                          sizeFactor: 1.1,
                        ),
                      ],
                    ),
                    ResponsiveSizedBox.height10,
                    const Row(
                      children: [
                        ResponsiveText(
                          'GST (5%)',
                          sizeFactor: 1.1,
                        ),
                        Spacer(),
                        ResponsiveText(
                          '\u20B9 220.00',
                          sizeFactor: 1.1,
                        ),
                      ],
                    ),
                    ResponsiveSizedBox.height20,
                    const DashedDivider(
                      height: 1,
                      color: Colors.black,
                      dashWidth: 5,
                      dashSpace: 3,
                    ),
                    ResponsiveSizedBox.height20,
                    const Row(
                      children: [
                        ResponsiveText(
                          'Grand Total',
                          sizeFactor: 1.1,
                        ),
                        Spacer(),
                        ResponsiveText(
                          '\u20B9 220.00',
                          weight: FontWeight.bold,
                          sizeFactor: 1.2,
                        ),
                      ],
                    ),
                    ResponsiveSizedBox.height20,
                    const DashedDivider(
                      height: 1,
                      color: Colors.black,
                      dashWidth: 5,
                      dashSpace: 3,
                    ),
                    ResponsiveSizedBox.height20,
                    TextStyles.caption(
                        text:
                            'By clicking on the paynow button,you agree to all the terms & conditions of the application described in our website'),
                    ResponsiveSizedBox.height20,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.kyellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusStyles.kradius20(),
                          ),
                        ),
                        child: const Text(
                          'Pay Now',
                          style: TextStyle(
                              color: Appcolors.kblackColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                    ),
                    ResponsiveSizedBox.height10,
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
