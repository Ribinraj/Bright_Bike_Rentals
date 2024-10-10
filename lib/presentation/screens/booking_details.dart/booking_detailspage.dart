import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/presentation/screens/booking_details.dart/widgets/customwidgets.dart';

import 'package:bright_bike_rentals/presentation/widgets/dash_devider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenBookDetailsingPage extends StatelessWidget {
  const ScreenBookDetailsingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kyellowColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kyellowColor,
        title: TextStyles.headline(text: 'Booking Details'),
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
        margin: const EdgeInsets.only(top: 25),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Appcolors.kwhiteColor),
        child: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            ResponsiveSizedBox.height20,
            const ImageCarousel(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyles.subheadline(
                                text: 'Activa 4G BS4',
                              ),
                              TextStyles.body(
                                  text: '01', weight: FontWeight.bold),
                            ],
                          ),
                          Row(
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ResponsiveText(
                                    'From',
                                    sizeFactor: .8,
                                    weight: FontWeight.bold,
                                  ),
                                  ResponsiveText(
                                    'To',
                                    sizeFactor: .8,
                                    weight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              Container(
                                width: 2,
                                color: Appcolors.kgreyColor,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                              ),
                              const Column(
                                children: [
                                  ResponsiveText(
                                    '23 March 2024 09:00 AM',
                                    sizeFactor: .8,
                                  ),
                                  ResponsiveText(
                                    '23 March 2024 09:00 AM',
                                    sizeFactor: .8,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const ResponsiveText(
                                '\u20B9 500',
                                weight: FontWeight.bold,
                                sizeFactor: 1.2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                          'Pay 20% Advance',
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
                    ResponsiveSizedBox.height10
                  ],
                ),
              ),
            ),
            ResponsiveSizedBox.height20,
            ElevatedButton(
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
                'Back',
                style: TextStyle(
                    color: Appcolors.kblackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
