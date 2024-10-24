import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:flutter/material.dart';

class PaymentIconButton extends StatelessWidget {
  final bool isClicked;
  final VoidCallback onPressed;

  const PaymentIconButton({
    super.key,
    required this.isClicked,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.wp(5),
      height: ResponsiveUtils.hp(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Appcolors.kblackColor,
          width: 1,
        ),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(
          Icons.circle,
          size: ResponsiveUtils.wp(4),
          color: isClicked ? Appcolors.kyellowColor : Appcolors.kwhiteColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
