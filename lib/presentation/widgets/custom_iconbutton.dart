import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class ResponsiveIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color iconcolor;
  const ResponsiveIconButton(
      {super.key, required this.icon, required this.onPressed, required this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: ResponsiveUtils.iconSize(6), // 6% of screen width
        color: iconcolor,
      ),
      onPressed: onPressed,
    );
  }
}
