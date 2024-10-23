import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';


import 'package:bright_bike_rentals/presentation/blocs/fetch_profilebloc.dart/fetch_profile_bloc.dart';

import 'package:bright_bike_rentals/presentation/screens/edit_profilepage/edit_profilepage.dart';
import 'package:bright_bike_rentals/presentation/screens/profile_page/widgets/shimmer.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchProfileBloc>().add(FetchprofiledataInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: BlocConsumer<FetchProfileBloc, FetchProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FetchProfileDataLoadingState) {
            return ProfilePageShimmer();
          }
          if (state is FetchProfileDataSuccessState) {
            final profile = state.customerData;
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTopSection(profile.customerName),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ResponsiveSizedBox.height30,
                        _buildInfoCard(
                            'Mobile', profile.customerMobile, Icons.phone),
                        ResponsiveSizedBox.height30,
                        _buildInfoCard(
                            'Email', profile.customerEmail, Icons.email),
                        ResponsiveSizedBox.height30,
                        _buildInfoCard('Driving License',
                            profile.customerDrivingLicense ?? '', Icons.book),
                        ResponsiveSizedBox.height30,
                        // _buildInfoCard(
                        //     'Adress',
                        //     'Oottupurath house, amarambalalam south po',
                        //     Icons.location_city),
                        // ResponsiveSizedBox.height20,
                        // _buildInfoCard('State', 'Kerala', Icons.location_on),
                        // ResponsiveSizedBox.height20,
                        CustomElevatedButton(
                          onpress: () {
                            navigatePush(
                                context, const ScreenEditProfilePage());
                          },
                          text: 'Edit Profile',
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (state is FetchprofileDataErrorState) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildTopSection(String name) {
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
              margin: const EdgeInsets.only(top: 80, bottom: 10),
              child: const CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(Appconstants.logo),
                ),
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Appcolors.kblackColor,
              ),
            ),
            ResponsiveSizedBox.height50
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
            decoration: BoxDecoration(
              color: Appcolors.kyellowColor.withOpacity(.8),
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
