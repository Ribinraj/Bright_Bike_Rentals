import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ScreenHomepageShimmer extends StatelessWidget {
  const ScreenHomepageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
        children: [
          Shimmer(
            gradient: LinearGradient(colors: [
              Appcolors.kgreyColor.withOpacity(.5),
              Appcolors.kbackgroundgrey
            ]),
            child: Container(
              height: ResponsiveUtils.hp(4),
              width: double.infinity,
              color: Colors.amber,
            ),
          ),
          ResponsiveSizedBox.height10,
          Shimmer(
            gradient: LinearGradient(colors: [
              Appcolors.kgreyColor.withOpacity(.5),
              Appcolors.kbackgroundgrey
            ]),
            child: Container(
              height: ResponsiveUtils.hp(4),
              width: double.infinity,
              color: Colors.amber,
            ),
          ),
          ResponsiveSizedBox.height10,
          Shimmer(
            gradient: LinearGradient(colors: [
              Appcolors.kgreyColor.withOpacity(.5),
              Appcolors.kbackgroundgrey
            ]),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber,
              ),
              height: ResponsiveUtils.hp(20),
              width: double.infinity,
            ),
          ),
          ResponsiveSizedBox.height10,
          Shimmer(
            gradient: LinearGradient(colors: [
              Appcolors.kgreyColor.withOpacity(.5),
              Appcolors.kbackgroundgrey
            ]),
            child: Container(
              height: ResponsiveUtils.hp(4),
              width: double.infinity,
              color: Colors.amber,
            ),
          ),
          ResponsiveSizedBox.height10,
          SizedBox(
            height: ResponsiveUtils.hp(18), // Adjusted from fixed 210
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
              itemBuilder: (context, index) {
                return Shimmer(
                  gradient: LinearGradient(colors: [
                    Appcolors.kgreyColor.withOpacity(.5),
                    Appcolors.kbackgroundgrey
                  ]),
                  child: Shimmer(
                    gradient: LinearGradient(colors: [
                      Appcolors.kgreyColor.withOpacity(.5),
                      Appcolors.kbackgroundgrey
                    ]),
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: ResponsiveUtils.wp(35),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          ResponsiveSizedBox.height20,
          Shimmer(
            gradient: LinearGradient(colors: [
              Appcolors.kgreyColor.withOpacity(.5),
              Appcolors.kbackgroundgrey
            ]),
            child: Container(
              height: ResponsiveUtils.hp(4),
              width: double.infinity,
              color: Colors.amber,
            ),
          ),
          ResponsiveSizedBox.height10,
          Container(
            height: ResponsiveUtils.hp(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ResponsiveUtils.wp(8)),
                topRight: Radius.circular(ResponsiveUtils.wp(8)),
              ),
              color: Appcolors.kwhiteColor,
            ),
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                itemBuilder: (context, index) {
                  return Shimmer(
                    gradient: LinearGradient(colors: [
                      Appcolors.kgreyColor.withOpacity(.5),
                      Appcolors.kbackgroundgrey
                    ]),
                    child: Container(
                      margin: const EdgeInsets.only(right: 4),
                      width: ResponsiveUtils.wp(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
