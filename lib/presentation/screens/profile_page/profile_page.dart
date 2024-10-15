import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/images.dart';
import 'package:bright_bike_rentals/presentation/screens/edit_profilepage/edit_profilepage.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTopSection(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ResponsiveSizedBox.height30,
                  _buildInfoCard('Mobile', '9946802969', Icons.phone),
                  ResponsiveSizedBox.height20,
                  _buildInfoCard('Email', 'ribinrajop', Icons.email),
                  ResponsiveSizedBox.height20,
                  _buildInfoCard('Driving License', 'NBR12456', Icons.book),
                  ResponsiveSizedBox.height20,
                  _buildInfoCard(
                      'Adress',
                      'Oottupurath house, amarambalalam south po',
                      Icons.location_city),
                  ResponsiveSizedBox.height20,
                  _buildInfoCard('State', 'Kerala', Icons.location_on),
                  ResponsiveSizedBox.height20,
                  CustomElevatedButton(
                    onpress: () {
                      navigatePush(context, const ScreenEditProfilePage());
                    },
                    text: 'Edit Profile',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Container(
      // height: ResponsiveUtils.hp(35),
      decoration: const BoxDecoration(
        color: Appcolors.kyellowColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 10),
              child: const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(AppImages.logo),
                ),
              ),
            ),
            const Text(
              'Ribinraj op',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Appcolors.kblackColor,
              ),
            ),
            ResponsiveSizedBox.height20
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Appcolors.kyellowColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Appcolors.kblackColor),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
