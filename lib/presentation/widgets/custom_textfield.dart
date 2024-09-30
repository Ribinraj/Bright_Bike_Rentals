import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.controller,
    required this.labelText,
    this.textInputType,
    this.validator,
    this.suffixIcon,
    this.obscureText,
  });

  final TextEditingController controller;
  final String labelText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Appcolors.kblackColor,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: textInputType,
      style: const TextStyle(
        fontSize: 15,
      ),
      decoration: InputDecoration(
          fillColor: Colors.transparent,
          filled: true,
          // border: InputBorder.none,
          isDense: true,
          errorMaxLines: 3,
          suffixIcon: suffixIcon,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          labelText: labelText,
          labelStyle: const TextStyle(
              color: Appcolors.kblackColor,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.kblackColor, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.kblackColor, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.kredColor, width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadiusStyles.kradius10(),
              borderSide:
                  const BorderSide(color: Appcolors.kredColor, width: 1.5))),
    );
  }
}
