import 'dart:developer';

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/searchpage/widgets/date_time_selection_widget.dart';
import 'package:bright_bike_rentals/presentation/screens/searchpage/widgets/search_result.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ScreenSearchPage extends StatefulWidget {
  const ScreenSearchPage({super.key});

  @override
  State<ScreenSearchPage> createState() => _ScreenSearchPageState();
}

class _ScreenSearchPageState extends State<ScreenSearchPage> {
  DateTime? fromDate;

  TimeOfDay? fromTime;

  DateTime? toDate;

  TimeOfDay? toTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyles.headline(text: 'Search your bike'),
            ResponsiveSizedBox.height5,
            Container(
              child: Lottie.asset(animation),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Appcolors.kwhiteColor,
                  border: Border.all(
                    color: Appcolors.kgreyColor.withOpacity(.2),
                    width: 1.3,
                  ),
                  borderRadius: BorderRadiusStyles.kradius10(),
                  boxShadow: [
                    BoxShadow(
                      color: Appcolors.kyellowColor.withOpacity(0.3),
                      offset: const Offset(0, 3),
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.body(
                      text: 'From',
                      weight: FontWeight.w600,
                      color: Appcolors.kgreyColor),
                  ResponsiveSizedBox.height5,
                  DateTimeSelectionWidget(
                    onDateTimeChanged: (date, time) {
                      setState(() {
                        fromDate = date;
                        fromTime = time;
                      });
                    },
                  ),
                  ResponsiveSizedBox.height30,
                  TextStyles.body(
                      text: 'To',
                      weight: FontWeight.w600,
                      color: Appcolors.kgreyColor),
                  DateTimeSelectionWidget(
                    onDateTimeChanged: (date, time) {
                      setState(() {
                        toDate = date;
                        toTime = time;
                      });
                    },
                  ),
                  ResponsiveSizedBox.height50,
                  CustomElevatedButton(
                      onpress: () {
                        if (fromDate != null &&
                            fromTime != null &&
                            toDate != null &&
                            toTime != null) {
                          log(fromDate.toString());
                          log(toDate.toString());
                        }
                        navigatePush(context, const ScreenSearchResult());
                      },
                      text: 'Search')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
