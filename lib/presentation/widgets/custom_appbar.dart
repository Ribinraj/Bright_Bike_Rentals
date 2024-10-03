import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.format_align_left_rounded),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.wp(1)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.kyellowColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyles.kradius20(),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveUtils.wp(3),
                  vertical: ResponsiveUtils.hp(1)),
            ),
            child: const Row(
              children: [
                Icon(Icons.phone_in_talk_outlined,
                    color: Appcolors.kblackColor),
                SizedBox(width: 5),
                Text(
                  '+91-9845627893',
                  style: TextStyle(
                      color: Appcolors.kblackColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
