import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/presentation/screens/notificationpage/notificationpage.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_callingbutton.dart';
import 'package:bright_bike_rentals/core/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Appcolors.kwhiteColor,
      leading: IconButton(
        icon: const Icon(Icons.format_align_left_rounded),
        onPressed: () {
          Scaffold.of(context).openDrawer();
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
            icon: Icon(
              Icons.notifications,
              color: Appcolors.kblackColor,
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Appcolors.kyellowColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: ResponsiveUtils.wp(20),
                  height: ResponsiveUtils.hp(10),
                  child: Image.asset(
                    AppImages.logo,
                    fit: BoxFit.contain,
                  ),
                ),
                TextStyles.body(
                    text: 'Bright Bike Rentals', weight: FontWeight.w600),
                TextStyles.caption(text: 'https://brightbikerentals.com/')
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: TextStyles.body(
              text: 'Home',
              weight: FontWeight.w600,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: TextStyles.body(
              text: 'About us',
              weight: FontWeight.w600,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/tax.png',
              width: ResponsiveUtils.wp(6.5),
              height: ResponsiveUtils.hp(2.5),
            ),
            title: TextStyles.body(
              text: 'Our Tariff',
              weight: FontWeight.w600,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.add_ic_call_outlined),
            title: TextStyles.body(
              text: 'Contact us',
              weight: FontWeight.w600,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: TextStyles.body(
              text: 'Cancellation Policy',
              weight: FontWeight.w600,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: TextStyles.body(
              text: 'Refund Policy',
              weight: FontWeight.w600,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: Image.asset(
              'assets/icons/terms-and-conditions.png',
              width: ResponsiveUtils.wp(6),
              height: ResponsiveUtils.hp(2.5),
            ),
            title: TextStyles.body(
              text: 'Terms & Conditions',
              weight: FontWeight.w600,
            ),
            onTap: () {
              Navigator.pop(context);
              // Add navigation logic here
            },
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: TextStyles.body(
                  text: 'Logout',
                  weight: FontWeight.w600,
                ),
                onTap: () {
                  Navigator.pop(context);
                  // Add logout logic here
                },
              ),
              SizedBox(
                height: ResponsiveUtils.hp(7),
              ),
              TextStyles.caption(text: 'Designed & Developed by'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextStyles.caption(
                      text: 'Crisant Technologies', weight: FontWeight.w600),
                  TextStyles.caption(text: ', Mysuru'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
