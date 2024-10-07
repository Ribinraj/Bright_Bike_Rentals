import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextStyles.headline(text: 'cart'),
    
        SizedBox(
          height: ResponsiveUtils.hp(3.5),
          width: ResponsiveUtils.wp(38),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.kblackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ResponsiveUtils.wp(2)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, color: Appcolors.kwhiteColor),
                ResponsiveSizedBox.width10,
                const ResponsiveText(
                  'Add More',
                  sizeFactor: .9,
                  color: Appcolors.kwhiteColor,
                  weight: FontWeight.w600,
                )

              ],
            ),
          ),
        ),
      ],
    );
  }
}
