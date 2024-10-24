import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:flutter/material.dart';

class CustomReadOnlyTextField extends StatelessWidget {
  const CustomReadOnlyTextField({
    super.key,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: true, // Makes it non-editable
      enabled: false, // Optional: makes it visually appear disabled
      style: const TextStyle(
        fontSize: 15,
        color: Appcolors.kblackColor, // Keep text visible even when disabled
      ),
      decoration: InputDecoration(
        fillColor: Colors.grey[100], // Light grey background to indicate readonly
        filled: true,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Appcolors.kblackColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadiusStyles.kradius10(),
          borderSide: const BorderSide(
            color: Appcolors.kblackColor,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder( // Add this for disabled state
          borderRadius: BorderRadiusStyles.kradius10(),
          borderSide: const BorderSide(
            color: Appcolors.kblackColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadiusStyles.kradius10(),
          borderSide: const BorderSide(
            color: Appcolors.kblackColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}