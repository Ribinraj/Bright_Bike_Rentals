// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/constants.dart';
// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
// import 'package:bright_bike_rentals/presentation/widgets/custom_rounded_elevatedbutton.dart';
// import 'package:flutter/material.dart';

// class ScreenSearchResult extends StatefulWidget {
//   const ScreenSearchResult({super.key});

//   @override
//   State<ScreenSearchResult> createState() => _ScreenSearchResultState();
// }

// class _ScreenSearchResultState extends State<ScreenSearchResult> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       drawer: CustomDrawer(),
//       body: ListView.builder(
//           padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Container(
//               margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(4)),
//               padding: EdgeInsets.symmetric(
//                   vertical: ResponsiveUtils.wp(2),
//                   horizontal: ResponsiveUtils.wp(3)),
//               decoration: BoxDecoration(
//                 color: Appcolors.kwhiteColor,
//                 border: Border.all(
//                   color: Appcolors.kyellowColor,
//                   width: 1.5,
//                 ),
//                 borderRadius: BorderRadiusStyles.kradius10(),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     offset: const Offset(0, 4),
//                     blurRadius: 2,
//                     spreadRadius: 0,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 children: [
//                   SizedBox(
//                     width: ResponsiveUtils.wp(25),
//                     height: ResponsiveUtils.hp(12),
//                     child: Image.asset(
//                       'assets/images/bicycle-wheel-against-sky-sunset.jpg',
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   ResponsiveSizedBox.width20,
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextStyles.body(
//                                     text: 'Activa 4G BS4',
//                                     weight: FontWeight.bold),
//                                 TextStyles.caption(text: 'Unlimeted Kilometers')
//                               ],
//                             ),
//                             const Spacer(),
//                             TextStyles.body(
//                                 text: '\u20B9 500', weight: FontWeight.bold)
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 TextStyles.caption(
//                                     text: 'From',
//                                     weight: FontWeight.bold,
//                                     color: Appcolors.kblackColor),
//                                 TextStyles.caption(
//                                     text: 'To',
//                                     weight: FontWeight.bold,
//                                     color: Appcolors.kblackColor),
//                               ],
//                             ),
//                             const Spacer(),
//                             Container(
//                               width: 2,
//                               color: Appcolors.kgreyColor,
//                               height: ResponsiveUtils.hp(3),
//                               margin:
//                                   const EdgeInsets.symmetric(horizontal: 15),
//                             ),
//                             const Spacer(),
//                             Column(
//                               children: [
//                                 TextStyles.caption(
//                                     text: '26 March 2024 09:00 AM',
//                                     color: Appcolors.kblackColor),
//                                 TextStyles.caption(
//                                     text: '26 March 2024 09:00 AM',
//                                     color: Appcolors.kblackColor),
//                               ],
//                             )
//                           ],
//                         ),
//                         ResponsiveSizedBox.height5,
//                         SizedBox(
//                           width: double.infinity,
//                           height: ResponsiveUtils.hp(3.5),
//                           child: CustomRoundElevatedButton(
//                             text: index == 2 ? 'Sold out' : 'Booknow',
//                             buttoncolor: index == 2
//                                 ? Appcolors.kgreyColor
//                                 : Appcolors.korangeColor,
//                             onpress: () {},
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }
//////////////////
import 'dart:developer';

import 'package:bright_bike_rentals/presentation/screens/searchpage/widgets/date_time_selection_widget.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_elevatedbutton.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

class ScreenSearchResult extends StatefulWidget {
  const ScreenSearchResult({super.key});

  @override
  State<ScreenSearchResult> createState() => _ScreenSearchResultState();
}

class _ScreenSearchResultState extends State<ScreenSearchResult> {
  late ScrollController _scrollController;
  bool _isCollapsed = false;
  DateTime? fromDate;

  TimeOfDay? fromTime;

  DateTime? toDate;

  TimeOfDay? toTime;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _isCollapsed = _scrollController.hasClients &&
              _scrollController.offset >
                  (MediaQuery.of(context).size.height * 0.2);
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kbackgroundgrey,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            collapsedHeight: 70,
            floating: false,
            pinned: true,
            backgroundColor: Appcolors.kbackgroundgrey,
            elevation: 0,
            flexibleSpace: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(20)),
              child: FlexibleSpaceBar(
                background: Container(
                  color: Appcolors.kyellowColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Rental Bikes',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildDateTimeInfo(),
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(CupertinoIcons.chevron_back,
                  size: 35, color: _isCollapsed ? Colors.black : Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: _isCollapsed ? _buildDateTimeInfo(isCollapsed: true) : null,
          ),
          SliverPadding(
            padding: EdgeInsets.all(ResponsiveUtils.wp(8)),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(6)),
                    decoration: BoxDecoration(
                      color: Appcolors.kwhiteColor,
                      border: Border.all(
                        color: Appcolors.kgreyColor.withOpacity(.5),
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(0, 4),
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ResponsiveSizedBox.height30,
                        SizedBox(
                          width: ResponsiveUtils.wp(60),
                          height: ResponsiveUtils.hp(15),
                          child: Image.asset(
                            'assets/images/moto-food-delivery-man-rides-motor-bike-with-thermal-backpack-food-deliver-service-generative-ai.jpg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: ResponsiveUtils.hp(2)),
                        TextStyles.subheadline(
                          text: 'Activa 4G BS4',
                          weight: FontWeight.bold,
                        ),
                        TextStyles.caption(
                          text: 'Unlimited Kilometers',
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: index == 2
                                ? Appcolors.kgreyColor
                                : Appcolors.kyellowColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: ResponsiveUtils.wp(2),
                                horizontal: ResponsiveUtils.wp(6)),
                            child: Row(
                              children: [
                                TextStyles.subheadline(
                                  text: '\u20B9 500',
                                ),
                                const Spacer(),
                                TextStyles.subheadline(
                                  text: index == 2 ? 'Sold Out' : 'Book Now',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateTimeInfo({bool isCollapsed = false}) {
    TextStyle style = TextStyle(
        fontSize: isCollapsed ? 10 : 16,
        color: Appcolors.kblackColor,
        fontWeight: FontWeight.w600);

    return GestureDetector(
      onTap: () {
        _showTopSheet(context);
      },
      child: Container(
        width: isCollapsed ? double.infinity : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pick-up',
              style: TextStyle(
                color: Appcolors.kgreyColor,
                fontWeight: FontWeight.w600,
                fontSize: isCollapsed ? 10 : 14,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveSizedBox.width30,
                Text('26 March 2024 09:00 AM', style: style),
              ],
            ),
            if (!isCollapsed)
              SizedBox(width: ResponsiveUtils.wp(60), child: const Divider()),
            Text(
              'Drop off',
              style: TextStyle(
                color: Appcolors.kgreyColor,
                fontWeight: FontWeight.w600,
                fontSize: isCollapsed ? 10 : 14,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveSizedBox.width30,
                Text('26 March 2024 09:00 AM', style: style),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///////////////
  void _showTopSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation1, animation2) {
        return Container();
      },
      transitionBuilder: (context, animation1, animation2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: Align(
            alignment: Alignment.topCenter,
            child: Material(
              child: Container(
                height: screenHeight * 0.45,
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveSizedBox.height50,
                    TextStyles.headline(text: 'Search your bike'),
                    ResponsiveSizedBox.height5,
                    TextStyles.body(text: 'From', weight: FontWeight.normal),
                    ResponsiveSizedBox.height5,
                    DateTimeSelectionWidget(
                      onDateTimeChanged: (date, time) {
                        setState(() {
                          fromDate = date;
                          fromTime = time;
                        });
                      },
                    ),
                    ResponsiveSizedBox.height30,
                    TextStyles.body(text: 'To', weight: FontWeight.normal),
                    DateTimeSelectionWidget(
                      onDateTimeChanged: (date, time) {
                        setState(() {
                          toDate = date;
                          toTime = time;
                        });
                      },
                    ),
                    ResponsiveSizedBox.height50,
                    CustomElevatedButton(
                        onpress: () {
                          if (fromDate != null &&
                              fromTime != null &&
                              toDate != null &&
                              toTime != null) {
                            log(fromDate.toString());
                            log(toDate.toString());
                          }
                          Navigator.of(context).pop();
                        },
                        text: 'Search')
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
