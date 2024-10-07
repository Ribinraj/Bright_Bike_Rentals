import 'package:bright_bike_rentals/core/colors.dart';

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
      width: 20,
      height: 20,
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
          size: 18,
          color: isClicked ?Appcolors.kyellowColor : Appcolors.kgreyColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
