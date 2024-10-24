import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/notificationpage/notificationpage.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_callingbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBackbuttonAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomBackbuttonAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.kwhiteColor,
      leading: IconButton(
        icon: const Icon(CupertinoIcons.chevron_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.wp(1)),
            child: const PhoneCallButton()),
        IconButton(
            onPressed: () {
              navigatePush(context, NotificationPage());
            },
            icon: const Icon(
              Icons.notifications,
              color: Appcolors.kblackColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
