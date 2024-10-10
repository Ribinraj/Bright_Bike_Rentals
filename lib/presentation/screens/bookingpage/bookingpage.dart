// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/constants.dart';
// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
// import 'package:flutter/material.dart';

// class ScreenBookingPage extends StatefulWidget {
//   const ScreenBookingPage({super.key});

//   @override
//   State<ScreenBookingPage> createState() => _ScreenBookingPageState();
// }

// class _ScreenBookingPageState extends State<ScreenBookingPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CustomAppBar(),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ResponsiveSizedBox.height10,
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.wp(4)),
//             child: TextStyles.subheadline(text: 'My Bookings'),
//           ),
//           TabBar(
//             controller: _tabController,
//             indicatorColor: Appcolors.kyellowColor,
//             labelColor: Appcolors.kblackColor,
//             unselectedLabelColor: Appcolors.kgreyColor,
//             labelStyle:
//                 const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//             tabs: const [
//               Tab(text: 'Upcoming'),
//               Tab(
//                 text: 'Completed',
//               ),
//             ],
//           ),
//           Expanded(
//             child: Container(
//               color: Appcolors.kbackgroundgrey,
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   ListView.builder(
//                       padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding:
//                               EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             //height: ResponsiveUtils.hp(13),
//                             decoration: BoxDecoration(
//                               color: Appcolors.kwhiteColor,
//                               border: Border.all(
//                                 color: Appcolors.kgreyColor.withOpacity(.5),
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadiusStyles.kradius10(),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   offset: const Offset(0, 4),
//                                   blurRadius: 2,
//                                   spreadRadius: 0,
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       SizedBox(
//                                         width: ResponsiveUtils.wp(15),
//                                         height: ResponsiveUtils.hp(5.5),
//                                         child: Image.asset(
//                                           'assets/images/bicycle-wheel-against-sky-sunset.jpg',
//                                           fit: BoxFit.contain,
//                                         ),
//                                       ),
//                                       ResponsiveSizedBox.height10,
//                                       TextStyles.caption(
//                                           text: 'Activa 4G BS4',
//                                           weight: FontWeight.bold,
//                                           color: Appcolors.kblackColor),
//                                       const Row(
//                                         children: [
//                                           ResponsiveText(
//                                             'Qty:',
//                                             sizeFactor: .6,
//                                           ),
//                                           ResponsiveText(
//                                             '01',
//                                             sizeFactor: .6,
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   ResponsiveSizedBox.width10,
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       TextStyles.caption(
//                                         text: 'Pickup',
//                                       ),
//                                       Row(
//                                         children: [
//                                           TextStyles.caption(
//                                               text: '23 March 2024 ',
//                                               color: Appcolors.kblackColor),
//                                           TextStyles.caption(
//                                               text: '09:00 AM',
//                                               color: Appcolors.kblackColor),
//                                         ],
//                                       ),
//                                       TextStyles.caption(
//                                         text: 'Drop off',
//                                       ),
//                                       Row(
//                                         children: [
//                                           TextStyles.caption(
//                                               text: '23 March 2024 ',
//                                               color: Appcolors.kblackColor),
//                                           TextStyles.caption(
//                                               text: '09:00 AM',
//                                               color: Appcolors.kblackColor),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   // ... other widgets remain the same ...
//                                   const Spacer(),
//                                   Column(
//                                     // mainAxisAlignment:
//                                     // MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       ResponsiveSizedBox.height10,
//                                       const ResponsiveText(
//                                         'Balance',
//                                         sizeFactor: .6,
//                                       ),
//                                       ResponsiveSizedBox.height5,
//                                       TextStyles.subheadline(
//                                         text: '\u20B9 500',
//                                       ),
//                                       const Spacer(),
//                                       Container(
//                                         height: ResponsiveUtils.hp(2.5),
//                                         width: ResponsiveUtils.wp(25),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadiusStyles.kradius30(),
//                                             color: Appcolors.korangeColor),
//                                         child: Center(
//                                           child: TextStyles.caption(
//                                               text: 'Pending',
//                                               color: Appcolors.kwhiteColor,
//                                               weight: FontWeight.bold),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                   ListView.builder(
//                       padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding:
//                               EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
//                           child: Container(
//                             padding: const EdgeInsets.all(8),
//                             //height: ResponsiveUtils.hp(13),
//                             decoration: BoxDecoration(
//                               color: Appcolors.kwhiteColor,
//                               border: Border.all(
//                                 color: Appcolors.kgreyColor.withOpacity(.5),
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadiusStyles.kradius10(),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   offset: const Offset(0, 4),
//                                   blurRadius: 2,
//                                   spreadRadius: 0,
//                                 ),
//                               ],
//                             ),
//                             child: Padding(
//                               padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
//                               child: Row(
//                                 children: [
//                                   Column(
//                                     children: [
//                                       SizedBox(
//                                         width: ResponsiveUtils.wp(15),
//                                         height: ResponsiveUtils.hp(5.5),
//                                         child: Image.asset(
//                                           'assets/images/bicycle-wheel-against-sky-sunset.jpg',
//                                           fit: BoxFit.contain,
//                                         ),
//                                       ),
//                                       ResponsiveSizedBox.height10,
//                                       TextStyles.caption(
//                                           text: 'Activa 4G BS4',
//                                           weight: FontWeight.bold,
//                                           color: Appcolors.kblackColor),
//                                       const Row(
//                                         children: [
//                                           ResponsiveText(
//                                             'Qty:',
//                                             sizeFactor: .6,
//                                           ),
//                                           ResponsiveText(
//                                             '01',
//                                             sizeFactor: .6,
//                                           ),
//                                         ],
//                                       )
//                                     ],
//                                   ),
//                                   ResponsiveSizedBox.width10,
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       TextStyles.caption(
//                                         text: 'Pickup',
//                                       ),
//                                       Row(
//                                         children: [
//                                           TextStyles.caption(
//                                               text: '23 March 2024 ',
//                                               color: Appcolors.kblackColor),
//                                           TextStyles.caption(
//                                               text: '09:00 AM',
//                                               color: Appcolors.kblackColor),
//                                         ],
//                                       ),
//                                       TextStyles.caption(
//                                         text: 'Drop off',
//                                       ),
//                                       Row(
//                                         children: [
//                                           TextStyles.caption(
//                                               text: '23 March 2024 ',
//                                               color: Appcolors.kblackColor),
//                                           TextStyles.caption(
//                                               text: '09:00 AM',
//                                               color: Appcolors.kblackColor),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                   // ... other widgets remain the same ...
//                                   const Spacer(),
//                                   Column(
//                                     // mainAxisAlignment:
//                                     // MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       ResponsiveSizedBox.height10,
//                                       const ResponsiveText(
//                                         'Balance',
//                                         sizeFactor: .6,
//                                       ),
//                                       ResponsiveSizedBox.height5,
//                                       TextStyles.subheadline(
//                                         text: '\u20B9 0',
//                                       ),
//                                       const Spacer(),
//                                       Container(
//                                         height: ResponsiveUtils.hp(2.5),
//                                         width: ResponsiveUtils.wp(25),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadiusStyles.kradius30(),
//                                             color: Appcolors.kyellowColor),
//                                         child: Center(
//                                           child: TextStyles.caption(
//                                               text: 'completed',
//                                               color: Appcolors.kwhiteColor,
//                                               weight: FontWeight.bold),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
/////////
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/screens/booking_details.dart/booking_detailspage.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';

class ScreenBookingPage extends StatefulWidget {
  const ScreenBookingPage({super.key});

  @override
  State<ScreenBookingPage> createState() => _ScreenBookingPageState();
}

class _ScreenBookingPageState extends State<ScreenBookingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveSizedBox.height10,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.wp(4)),
            child: TextStyles.subheadline(text: 'My Bookings'),
          ),
          TabBar(
            controller: _tabController,
            indicatorColor: Appcolors.kyellowColor,
            labelColor: Appcolors.kblackColor,
            unselectedLabelColor: Appcolors.kgreyColor,
            labelStyle:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
          Expanded(
            child: Container(
              color: Appcolors.kbackgroundgrey,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildListView(false),
                  _buildListView(true),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildListView(bool isCompleted) {
    return ListView.builder(
        padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
            child: GestureDetector(
              onTap: () {
                navigatePush(context, const ScreenBookDetailsingPage());
              },
              child: Container(
                padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
                decoration: BoxDecoration(
                  color: Appcolors.kwhiteColor,
                  border: Border.all(
                    color: Appcolors.kgreyColor.withOpacity(.5),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadiusStyles.kradius10(),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 4),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: ResponsiveUtils.wp(15),
                            height: ResponsiveUtils.hp(5.5),
                            child: Image.asset(
                              'assets/images/bicycle-wheel-against-sky-sunset.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          ResponsiveSizedBox.height10,
                          TextStyles.caption(
                              text: 'Activa 4G BS4',
                              weight: FontWeight.bold,
                              color: Appcolors.kblackColor),
                          Row(
                            children: const [
                              ResponsiveText(
                                'Qty:',
                                sizeFactor: .6,
                              ),
                              ResponsiveText(
                                '01',
                                sizeFactor: .6,
                              ),
                            ],
                          )
                        ],
                      ),
                      ResponsiveSizedBox.width10,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyles.caption(text: 'Pickup'),
                          Row(
                            children: [
                              TextStyles.caption(
                                  text: '23 March 2024 ',
                                  color: Appcolors.kblackColor),
                              TextStyles.caption(
                                  text: '09:00 AM',
                                  color: Appcolors.kblackColor),
                            ],
                          ),
                          TextStyles.caption(text: 'Drop off'),
                          Row(
                            children: [
                              TextStyles.caption(
                                  text: '23 March 2024 ',
                                  color: Appcolors.kblackColor),
                              TextStyles.caption(
                                  text: '09:00 AM',
                                  color: Appcolors.kblackColor),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ResponsiveText(
                                'Balance',
                                sizeFactor: .6,
                              ),
                              ResponsiveSizedBox.height5,
                              TextStyles.subheadline(
                                text: '\u20B9 ${isCompleted ? '0' : '500'}',
                              ),
                            ],
                          ),
                          Container(
                            height: ResponsiveUtils.hp(2.5),
                            width: ResponsiveUtils.wp(25),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusStyles.kradius30(),
                              color: isCompleted
                                  ? Appcolors.kyellowColor
                                  : Appcolors.korangeColor,
                            ),
                            child: Center(
                              child: TextStyles.caption(
                                  text: isCompleted ? 'Completed' : 'Pending',
                                  color: Appcolors.kwhiteColor,
                                  weight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
