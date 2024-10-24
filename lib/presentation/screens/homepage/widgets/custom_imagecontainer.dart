// // import 'package:bright_bike_rentals/core/colors.dart';
// // import 'package:bright_bike_rentals/core/constants.dart';
// // import 'package:bright_bike_rentals/core/responsive_utils.dart';
// // import 'package:carousel_slider/carousel_slider.dart';

// // import 'package:flutter/material.dart';

// // class Imagecontainer extends StatefulWidget {
// //   const Imagecontainer({
// //     super.key,
// //   });

// //   @override
// //   State<Imagecontainer> createState() => _ImagecontainerState();
// // }

// // class _ImagecontainerState extends State<Imagecontainer> {
// //   List caroselimages = [
// //     'assets/images/man-rides-dirt-bike-dirt-road-sunset.jpg',
// //     'assets/images/man-riding-motorcycle-road-with-words-word-side.jpg',
// //     'assets/images/moto-food-delivery-man-rides-motor-bike-with-thermal-backpack-food-deliver-service-generative-ai.jpg',
// //   ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         TextStyles.headline(text: 'Welcome Anand Jain'),
// //         TextStyles.headline(
// //             text: 'Find your ride', color: Appcolors.kgreyColor),
// //         ResponsiveSizedBox.height10,
// //         CarouselSlider.builder(
// //           itemCount: caroselimages.length,
// //           options: CarouselOptions(
// //               autoPlay: true,
// //               enlargeCenterPage: false,
// //               viewportFraction: 1,
// //               pageSnapping: true,
// //               autoPlayCurve: TreeSliver.defaultAnimationCurve,
// //               autoPlayAnimationDuration: const Duration(seconds: 1)),
// //           itemBuilder: (context, itemIndex, pageViewIndex) {
// //             return Padding(
// //               padding: const EdgeInsets.all(2),
// //               child: ClipRRect(
// //                 borderRadius: BorderRadiusStyles.kradius20(),
// //                 child: Image.asset(
// //                   caroselimages[itemIndex],
// //                   width: double.infinity,
// //                   height: ResponsiveUtils.hp(23),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //             );
// //           },
// //         ),

// //       ],
// //     );
// //   }
// // }
// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/constants.dart';
// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:bright_bike_rentals/presentation/blocs/fetch_dashbord_databloc/fetch_dashbord_bloc.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';

// class Imagecontainer extends StatefulWidget {
//   final FetchDashbordDataSuccessState state; // Add this
//   final String userName; // Add this if you need to display the user name

//   const Imagecontainer({
//     super.key,
//     required this.state,
//     required this.userName,
//   });

//   @override
//   State<Imagecontainer> createState() => _ImagecontainerState();
// }

// class _ImagecontainerState extends State<Imagecontainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         TextStyles.headline(text: 'Pedal your freedom,'),
//         TextStyles.headline(
//           text: 'Find your ride',
//           color: Appcolors.kgreyColor,
//         ),
//         ResponsiveSizedBox.height10,
//         CarouselSlider.builder(
//           itemCount: widget.state.dashborddata.banners.length,
//           options: CarouselOptions(
//             autoPlay: true,
//             enlargeCenterPage: false,
//             viewportFraction: 1,
//             pageSnapping: true,
//             autoPlayCurve: TreeSliver.defaultAnimationCurve,
//             autoPlayAnimationDuration: const Duration(seconds: 1),
//           ),
//           itemBuilder: (context, itemIndex, pageViewIndex) {
//             return Padding(
//               padding: const EdgeInsets.all(2),
//               child: ClipRRect(
//                 borderRadius: BorderRadiusStyles.kradius20(),
//                 child: Image.network(
//                   // Changed from Image.asset to Image.network
//                   widget
//                       .state.dashborddata.banners[itemIndex].bannerImageMobile,
//                   width: double.infinity,
//                   height: ResponsiveUtils.hp(23),
//                   fit: BoxFit.cover,
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(
//                         value: loadingProgress.expectedTotalBytes != null
//                             ? loadingProgress.cumulativeBytesLoaded /
//                                 loadingProgress.expectedTotalBytes!
//                             : null,
//                       ),
//                     );
//                   },
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       width: double.infinity,
//                       height: ResponsiveUtils.hp(23),
//                       color: Colors.grey[300],
//                       child: Icon(
//                         Icons.error_outline,
//                         size: ResponsiveUtils.wp(10),
//                         color: Colors.grey[500],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
