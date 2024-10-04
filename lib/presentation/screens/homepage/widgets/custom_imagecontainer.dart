import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:flutter/material.dart';

class Imagecontainer extends StatelessWidget {
  const Imagecontainer({
    super.key,
    
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyles.headline(text: 'Welcome Anand Jain'),
        TextStyles.headline(
            text: 'Find your ride', color: Appcolors.kgreyColor),
        ResponsiveSizedBox.height10,
        ClipRRect(
          borderRadius: BorderRadiusStyles.kradius20(),
          child: Image.asset(
            'assets/images/man-rides-dirt-bike-dirt-road-sunset.jpg',
            width: double.infinity,
            height: ResponsiveUtils.hp(23),
            fit: BoxFit.cover,
          ),
        ),
        ResponsiveSizedBox.height10,
        TextStyles.headline(text: 'Our Fleet'),
        ResponsiveSizedBox.height10,
      ],
    );
  }
}
