import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:flutter/material.dart';

class CustomRoundElevatedButton extends StatelessWidget {
  const CustomRoundElevatedButton({
    super.key, required this.onpress, required this.text, required this.buttoncolor,
  });
  final VoidCallback onpress;
  final String text;
  final Color buttoncolor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor:buttoncolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyles.kradius20(),
        ),
      ),
      child:  Text(
        text,
        style: const TextStyle(
            color: Appcolors.kblackColor,
            fontWeight: FontWeight.bold,
            fontSize: 13),
      ),
    );
  }
}
