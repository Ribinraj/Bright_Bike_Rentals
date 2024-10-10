import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';

import 'package:bright_bike_rentals/core/images.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopSection(),
            Container(
              margin: const EdgeInsets.all(30),
              padding: const EdgeInsets.only(bottom: 60, top: 20),
              decoration: BoxDecoration(
                color: Appcolors.kbackgroundgrey.withOpacity(.7),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    width: 1, color: Appcolors.kgreyColor.withOpacity(.5)),
              ),
              child: Column(
                children: [
                  _buildBottomSection(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: CustomElevatedButton(
                      onpress: () {},
                      text: 'Edit Profile',
                    ),
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
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              child: const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 75,
                  backgroundImage: AssetImage(AppImages.logo),
                ),
              ),
            ),
            const Text(
              'Ribinraj op',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Appcolors.kblackColor,
              ),
            ),
            ResponsiveSizedBox.height30,
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          _buildInfoCard('Mobile', '9946802969', Icons.phone),
          const SizedBox(height: 20),
          _buildInfoCard('Email', 'ribinrajop', Icons.email),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Appcolors.kyellowColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color:Appcolors.kblackColor),
          ),
          const SizedBox(width: 20),
          Column(
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
