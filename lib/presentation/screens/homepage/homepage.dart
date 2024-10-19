import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/custom_imagecontainer.dart';
import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/quates_card.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            ResponsiveSizedBox.height10,
            Row(
              children: [
                TextStyles.headline(
                  text: 'Top Picks',
                  color: Appcolors.kgreyColor,
                ),
                const Spacer(),
                Text(
                  'View More',
                  style: TextStyle(
                    color: Appcolors.kgreyColor,
                    fontSize: ResponsiveUtils.wp(3.5),
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: Appcolors.kgreyColor,
                  ),
                )
              ],
            ),
            ResponsiveSizedBox.height10,
            SizedBox(
              height: ResponsiveUtils.hp(21), // Adjusted from fixed 210
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemList.length,
                padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    //width: ResponsiveUtils.wp(45), // Added responsive width
                    margin: EdgeInsets.only(right: ResponsiveUtils.wp(2)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(ResponsiveUtils.wp(2)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: ResponsiveUtils.wp(0.5),
                          blurRadius: ResponsiveUtils.wp(1),
                          offset: Offset(0, ResponsiveUtils.hp(0.5)),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(ResponsiveUtils.wp(3)),
                          child: TextStyles.body(
                              text: itemList[index]['title']!,
                              weight: FontWeight.bold),
                        ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(ResponsiveUtils.wp(2)),
                          child: Image.asset(
                            itemList[index]['image']!,
                            width: ResponsiveUtils.wp(23),
                            height: ResponsiveUtils.hp(8),
                            fit: BoxFit.cover,
                          ),
                        ),
                        ResponsiveSizedBox.height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextStyles.caption(
                              text: 'starts from :',
                            ),
                            ResponsiveSizedBox.width10,
                            TextStyles.body(
                              text: '\u20B9 500',
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ResponsiveSizedBox.height20,
            TextStyles.headline(
              text: 'Customer Feedbacks',
              color: Appcolors.kgreyColor,
            ),
            Container(
              height: ResponsiveUtils.hp(40), // Adjusted from fixed 300

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ResponsiveUtils.wp(8)),
                  topRight: Radius.circular(ResponsiveUtils.wp(8)),
                ),
                color: Appcolors.kwhiteColor,
              ),
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                  itemBuilder: (context, index) {
                    return const SizedBox(
                      // width: ResponsiveUtils.wp(80), // Added responsive width
                      child: QuoteCard(
                        title: 'Good Service',
                        description:
                            'fjjjfdsjfjkljsdlfjklsdjfilsd,dfhfofsflsflsdjfklsdjlksjlsl,fhdhfjssshsfhksdfsdfks,fdslfjlsdjflsdjflsdjfsdlfjls',
                        name: 'Ribin',
                        position: 'Developer',
                      ),
                    );
                  },
                ),
              ),
            ),
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
  // Column(
  //             children: List.generate(
  //               itemList.length,
  //               (index) {
  //                 final item = itemList[index];
  //                 return Column(
  //                   children: [
  //                     Container(
  //                       margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
  //                       width: double.infinity,
  //                       // height: ResponsiveUtils.hp(15),
  //                       decoration: BoxDecoration(
  //                         gradient: const LinearGradient(
  //                           colors: [
  //                             Appcolors.kbackgroundgrey,
  //                             Appcolors.kwhiteColor,
  //                           ],
  //                           begin: Alignment.topLeft, // Gradient starting point
  //                           end: Alignment.bottomRight, // Gradient ending point
  //                         ),
  //                         border: Border.all(
  //                           color: Appcolors.kyellowColor.withOpacity(.6),
  //                           width: 1.3,
  //                         ),
  //                         borderRadius: BorderRadiusStyles.kradius10(),
  //                         boxShadow: [
  //                           BoxShadow(
  //                             color: Appcolors.kgreyColor.withOpacity(0.2),
  //                             offset: const Offset(0, 4),
  //                             blurRadius: 2,
  //                             spreadRadius: 0,
  //                           ),
  //                         ],
  //                       ),
  //                       child: Padding(
  //                         padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
  //                         child: Row(
  //                           children: [
  //                             SizedBox(
  //                               width: ResponsiveUtils.wp(30),
  //                               height: ResponsiveUtils.hp(13),
  //                               child: Image.asset(
  //                                 item['image']!,
  //                                 fit: BoxFit.contain,
  //                               ),
  //                             ),
  //                             ResponsiveSizedBox.width10,
  //                             Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 TextStyles.subheadline(
  //                                   text: item['title']!,
  //                                 ),
  //                                 TextStyles.caption(
  //                                     text: 'Starts from',
  //                                     weight: FontWeight.w600),
  //                                 Row(
  //                                   children: [
  //                                     const Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         ResponsiveText(
  //                                           'Monday-Thursday',
  //                                           weight: FontWeight.bold,
  //                                           sizeFactor: .9,
  //                                         ),
  //                                         ResponsiveText(
  //                                           'Friday-Sunday',
  //                                           weight: FontWeight.bold,
  //                                           sizeFactor: .9,
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     Container(
  //                                       width: 2,
  //                                       color: Appcolors.kblackColor,
  //                                       height: ResponsiveUtils.wp(13),
  //                                       margin: EdgeInsets.symmetric(
  //                                         horizontal: ResponsiveUtils.wp(3),
  //                                       ),
  //                                     ),
  //                                     Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       mainAxisAlignment:
  //                                           MainAxisAlignment.spaceBetween,
  //                                       children: [
  //                                         TextStyles.body(
  //                                             text: item['price1']!,
  //                                             weight: FontWeight.bold),
  //                                         TextStyles.body(
  //                                             text: item['price2']!,
  //                                             weight: FontWeight.bold)
  //                                       ],
  //                                     )
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                     ResponsiveSizedBox.height10
  //                   ],
  //                 );
  //               },
  //             ),
  //           )