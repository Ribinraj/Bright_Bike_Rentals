import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_rounded_elevatedbutton.dart';
import 'package:flutter/material.dart';

class ScreenSearchResult extends StatefulWidget {
  const ScreenSearchResult({super.key});

  @override
  State<ScreenSearchResult> createState() => _ScreenSearchResultState();
}

class _ScreenSearchResultState extends State<ScreenSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: ListView.builder(
          padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(4)),
              padding: EdgeInsets.symmetric(
                  vertical: ResponsiveUtils.wp(2),
                  horizontal: ResponsiveUtils.wp(3)),
              decoration: BoxDecoration(
                color: Appcolors.kwhiteColor,
                border: Border.all(
                  color: Appcolors.kyellowColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadiusStyles.kradius10(),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 4),
                    blurRadius: 2,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: ResponsiveUtils.wp(25),
                    height: ResponsiveUtils.hp(12),
                    child: Image.asset(
                      'assets/images/bicycle-wheel-against-sky-sunset.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  ResponsiveSizedBox.width20,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextStyles.body(
                                    text: 'Activa 4G BS4',
                                    weight: FontWeight.bold),
                                TextStyles.caption(text: 'Unlimeted Kilometers')
                              ],
                            ),
                            const Spacer(),
                            TextStyles.body(
                                text: '\u20B9 500', weight: FontWeight.bold)
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextStyles.caption(
                                    text: 'From',
                                    weight: FontWeight.bold,
                                    color: Appcolors.kblackColor),
                                TextStyles.caption(
                                    text: 'To',
                                    weight: FontWeight.bold,
                                    color: Appcolors.kblackColor),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              width: 2,
                              color: Appcolors.kgreyColor,
                              height: ResponsiveUtils.hp(3),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                TextStyles.caption(
                                    text: '26 March 2024 09:00 AM',
                                    color: Appcolors.kblackColor),
                                TextStyles.caption(
                                    text: '26 March 2024 09:00 AM',
                                    color: Appcolors.kblackColor),
                              ],
                            )
                          ],
                        ),
                        ResponsiveSizedBox.height5,
                        SizedBox(
                          width: double.infinity,
                          height: ResponsiveUtils.hp(3.5),
                          child: CustomRoundElevatedButton(
                            text: index == 2 ? 'Sold out' : 'Booknow',
                            buttoncolor: index == 2
                                ? Appcolors.kgreyColor
                                : Appcolors.korangeColor,
                            onpress: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
