import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';


import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfilePageShimmer extends StatelessWidget {
  const ProfilePageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Shimmer(
              gradient: LinearGradient(colors: [
                Appcolors.kgreyColor.withOpacity(.5),
                Appcolors.kbackgroundgrey
              ]),
              child: Container(
                height: ResponsiveUtils.hp(38),
                decoration: const BoxDecoration(
                  color: Appcolors.kyellowColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveSizedBox.height30,
                  _buildInfoCard(),
                  ResponsiveSizedBox.height30,
                  _buildInfoCard(),
                  ResponsiveSizedBox.height30,
                  _buildInfoCard(),
                  ResponsiveSizedBox.height50,
                  Shimmer(
                    gradient: LinearGradient(colors: [
                      Appcolors.kgreyColor.withOpacity(.5),
                      Appcolors.kbackgroundgrey
                    ]),
                    child: Container(
                      height: ResponsiveUtils.hp(6),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Appcolors.kyellowColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Shimmer(
      gradient: LinearGradient(colors: [
        Appcolors.kgreyColor.withOpacity(.5),
        Appcolors.kbackgroundgrey
      ]),
      child: Container(
        height: ResponsiveUtils.hp(10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Appcolors.kyellowColor,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
