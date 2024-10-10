import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/custom_imagecontainer.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenHomepage extends StatelessWidget {
  const ScreenHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> itemList = [
      {
        'image': 'assets/images/bicycle-wheel-against-sky-sunset.jpg',
        'title': 'Activa 4G BS4',
        'price1': '\u20B9 500',
        'price2': '\u20B9 700',
      },
      {
        'image': 'assets/images/bicycle-wheel-against-sky-sunset.jpg',
        'title': 'Dio STD BS4',
        'price1': '\u20B9 500',
        'price2': '\u20B9 700',
      },
      {
        'image': 'assets/images/bicycle-wheel-against-sky-sunset.jpg',
        'title': 'Activa 5G',
        'price1': '\u20B9 700',
        'price2': '\u20B9 1000',
      },
      {
        'image': 'assets/images/bicycle-wheel-against-sky-sunset.jpg',
        'title': 'Activa 4G BS4',
        'price1': '\u20B9 500',
        'price2': '\u20B9 700',
      },
      {
        'image': 'assets/images/bicycle-wheel-against-sky-sunset.jpg',
        'title': 'Dio STD BS4',
        'price1': '\u20B9 500',
        'price2': '\u20B9 700',
      },
      // Add more items as needed
    ];

    return Stack(children: [
      Scaffold(
        appBar: const CustomAppBar(),
        drawer: const CustomDrawer(),
        body: ListView(
          padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
          children: [
            const Imagecontainer(),
            Column(
              children: List.generate(
                itemList.length,
                (index) {
                  final item = itemList[index];
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
                        width: double.infinity,
                        // height: ResponsiveUtils.hp(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Appcolors.kbackgroundgrey,
                              Appcolors.kwhiteColor,
                            ],
                            begin: Alignment.topLeft, // Gradient starting point
                            end: Alignment.bottomRight, // Gradient ending point
                          ),
                          border: Border.all(
                            color: Appcolors.kyellowColor.withOpacity(.6),
                            width: 1.3,
                          ),
                          borderRadius: BorderRadiusStyles.kradius10(),
                          boxShadow: [
                            BoxShadow(
                              color: Appcolors.kgreyColor.withOpacity(0.2),
                              offset: const Offset(0, 4),
                              blurRadius: 2,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
                          child: Row(
                            children: [
                              SizedBox(
                                width: ResponsiveUtils.wp(30),
                                height: ResponsiveUtils.hp(13),
                                child: Image.asset(
                                  item['image']!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              ResponsiveSizedBox.width10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextStyles.subheadline(
                                    text: item['title']!,
                                  ),
                                  TextStyles.caption(
                                      text: 'Starts from',
                                      weight: FontWeight.w600),
                                  Row(
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ResponsiveText(
                                            'Monday-Thursday',
                                            weight: FontWeight.bold,
                                            sizeFactor: .9,
                                          ),
                                          ResponsiveText(
                                            'Friday-Sunday',
                                            weight: FontWeight.bold,
                                            sizeFactor: .9,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 2,
                                        color: Appcolors.kblackColor,
                                        height: ResponsiveUtils.wp(13),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ResponsiveUtils.wp(3),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextStyles.body(
                                              text: item['price1']!,
                                              weight: FontWeight.bold),
                                          TextStyles.body(
                                              text: item['price2']!,
                                              weight: FontWeight.bold)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ResponsiveSizedBox.height10
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      Positioned(
        bottom: ResponsiveUtils.hp(7),
        right: ResponsiveUtils.wp(1),
        child: SizedBox(
          width: ResponsiveUtils.wp(31),
          height: ResponsiveUtils.hp(4.5),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ResponsiveUtils.wp(20)),
            ),
            onPressed: _launchWhatsApp,
            backgroundColor: Appcolors.kgreenColor,
            elevation: 0,
            focusElevation: 0,
            child: Padding(
              padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
        ),
      )
    ]);
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
