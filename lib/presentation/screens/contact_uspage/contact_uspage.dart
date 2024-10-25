import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/settings_bloc/settings_bloc_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/contact_uspage/widgets/locate_usbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_callingbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custombackbuttonappbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenContactusPage extends StatelessWidget {
  const ScreenContactusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBackbuttonAppbar(),
      body: BlocBuilder<SettingsBlocBloc, SettingsBlocState>(
        builder: (context, state) {
          if (state is SettingsFetchingLoadingState) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: Appcolors.kyellowColor, size: 30),
            );
          }
          if (state is SettingsFetchingSuccessState) {
            return Padding(
              padding: EdgeInsets.all(ResponsiveUtils.wp(5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextStyles.headline(text: 'Contact us'),
                  ResponsiveSizedBox.height10,
                  TextStyles.subheadline(text: 'Location'),
                  ResponsiveSizedBox.height5,
                  Text(
                    state.settingsdata.businessAddress,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15),
                  ),
                  ResponsiveSizedBox.height10,
                  LocationButton(
                    settingsData: state.settingsdata,
                  ),
                  ResponsiveSizedBox.height30,
                  TextStyles.subheadline(text: 'Email Us'),
                  Text(
                    state.settingsdata.businessEmailAddress,
                    style: const TextStyle(fontSize: 15),
                  ),
                  ResponsiveSizedBox.height30,
                  TextStyles.subheadline(text: 'Call Us'),
                  Text(
                    state.settingsdata.businessPhoneNumber,
                    style: const TextStyle(fontSize: 15),
                  ),
                  ResponsiveSizedBox.height30,
                  SizedBox(
                    height: ResponsiveUtils.hp(4.5),
                    child: Row(
                      children: [
                        const PhoneCallButton(),
                        //ResponsiveSizedBox.width10,
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.kgreenColor),
                          onPressed: () {
                            _launchWhatsApp();
                          },
                          child: Padding(
                            padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/whatsapp.png',
                                  width: ResponsiveUtils.wp(7),
                                  height: ResponsiveUtils.hp(3.5),
                                ),
                                ResponsiveSizedBox.width5,
                                TextStyles.caption(
                                    text: 'Chat with us',
                                    color: Appcolors.kwhiteColor,
                                    weight: FontWeight.bold),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              child: Center(
                child: Text('Errorrrr'),
              ),
            );
          }
        },
      ),
    );
  }

  void _launchWhatsApp() async {
    const phoneNumber = '9846475854';
    const url = "https://wa.me/$phoneNumber";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
