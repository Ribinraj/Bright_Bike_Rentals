import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_editing_textfield.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/navigate_mainpage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenEditProfilePage extends StatefulWidget {
  const ScreenEditProfilePage({super.key});

  @override
  State<ScreenEditProfilePage> createState() => _ScreenEditProfilePageState();
}

class _ScreenEditProfilePageState extends State<ScreenEditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController drivingLicenseController =
      TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kbackgroundgrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(30.0),
          ),
          child: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  CupertinoIcons.chevron_back,
                  size: 30,
                )),
            title: TextStyles.subheadline(text: 'Edit profile'),
            backgroundColor: Appcolors.kyellowColor,
            centerTitle: true,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        children: [
          CustomEditingTextField(
              title: 'Name',
              icon: Icons.person,
              controller: nameController,
              hintText: 'Enter Name'),
          ResponsiveSizedBox.height30,
           CustomEditingTextField(
              title: 'Email',
              icon: Icons.email,
              controller: emailController,
              hintText: 'Enter Email Adress'),
          ResponsiveSizedBox.height30,
          CustomEditingTextField(
              title: 'Driving License',
              icon: Icons.book,
              controller: drivingLicenseController,
              hintText: 'Enter License number'),
          ResponsiveSizedBox.height30,
           CustomEditingTextField(
              title: 'Adress',
              icon: Icons.location_city,
              controller: adressController,
              hintText: 'Enter Adress'),
          ResponsiveSizedBox.height30,
          CustomEditingTextField(
              title: 'State',
              icon: Icons.location_on,
              controller: stateController,
              hintText: 'Enter State'),
          ResponsiveSizedBox.height50,
          CustomElevatedButton(
              onpress: () {
                navigateToMainPage(context, 4);
              },
              text: 'Update Profile')
        ],
      ),
    );
  }

  
}
