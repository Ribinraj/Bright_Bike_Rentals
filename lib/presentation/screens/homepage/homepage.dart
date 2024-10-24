import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/fetch_dashbord_databloc/fetch_dashbord_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/privacy_policy_bloc/privacy_policy_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/Top_pickspage.dart/top_pickspage.dart';

import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/quates_card.dart';
import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/shimmer.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_appbar.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class ScreenHomepage extends StatefulWidget {
  const ScreenHomepage({super.key});

  @override
  State<ScreenHomepage> createState() => _ScreenHomepageState();
}

class _ScreenHomepageState extends State<ScreenHomepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FetchDashbordBloc>().add(FetchDashbordDataInitialEvent());
    context.read<PrivacyPolicyBloc>().add(PrivacyPolicyInitialFetchingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      BlocConsumer<FetchDashbordBloc, FetchDashbordState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is FetchDashbordDataLoadingState) {
            return ScreenHomepageShimmer();
          }
          if (state is FetchDashbordDataSuccessState) {
            return Scaffold(
                appBar: const CustomAppBar(),
                drawer:CustomDrawer(),
                body: ListView(
                  padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
                  children: [
                    //Imagecontainer(state: state, userName: 'Ribin'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextStyles.headline(text: 'Pedal your freedom,'),
                        TextStyles.headline(
                          text: 'Find your ride',
                          color: Appcolors.kgreyColor,
                        ),
                        ResponsiveSizedBox.height10,
                        if (state.dashborddata.banners.isNotEmpty)
                          CarouselSlider.builder(
                            itemCount: state.dashborddata.banners.length,
                            options: CarouselOptions(
                              autoPlay: true,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              pageSnapping: true,
                              autoPlayCurve: Curves.easeInOut,
                              autoPlayAnimationDuration:
                                  const Duration(seconds: 1),
                            ),
                            itemBuilder: (context, itemIndex, pageViewIndex) {
                              return Padding(
                                padding: const EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadiusStyles.kradius20(),
                                  child: _buildImageWithFallback(
                                    imageUrl: state.dashborddata
                                        .banners[itemIndex].bannerImageMobile,
                                    width: double.infinity,
                                    height: ResponsiveUtils.hp(23),
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                    ResponsiveSizedBox.height10,
                    Row(
                      children: [
                        Expanded(
                          child: TextStyles.headline(
                            text: 'Top Picks',
                            color: Appcolors.kgreyColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigatePush(
                                context, ScreenTopPickspage(state: state));
                          },
                          child: Text(
                            'View More',
                            style: TextStyle(
                              color: Appcolors.kgreyColor,
                              fontSize: ResponsiveUtils.wp(3.5),
                              decoration: TextDecoration.underline,
                              decorationThickness: 1,
                              decorationColor: Appcolors.kgreyColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    ResponsiveSizedBox.height10,

                    // First ListView (Bikes) with intrinsic height
                    if (state.dashborddata.bikes.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicHeight(
                          child: Row(
                            children: List.generate(
                              state.dashborddata.bikes.length,
                              (index) {
                                final bikes = state.dashborddata.bikes;
                                return Container(
                                  width: ResponsiveUtils.wp(42),
                                  margin: EdgeInsets.only(
                                    right: ResponsiveUtils.wp(2),
                                    top: ResponsiveUtils.wp(1),
                                    bottom: ResponsiveUtils.wp(2),
                                    left: ResponsiveUtils.wp(1),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        ResponsiveUtils.wp(2)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: ResponsiveUtils.wp(0.5),
                                        blurRadius: ResponsiveUtils.wp(1),
                                        offset:
                                            Offset(0, ResponsiveUtils.hp(0.5)),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            ResponsiveUtils.wp(3)),
                                        child: Center(
                                          child: Text(
                                            bikes[index].bikeName,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: ResponsiveUtils.wp(3.5),
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      AspectRatio(
                                        aspectRatio: 15 / 8,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              ResponsiveUtils.wp(2)),
                                          child: _buildImageWithFallback(
                                            imageUrl: bikes[index].bikePicture,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            ResponsiveUtils.wp(2)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextStyles.caption(
                                                text: 'starts from :',
                                                color: Appcolors.kyellowColor),
                                            ResponsiveSizedBox.width10,
                                            TextStyles.body(
                                                text:
                                                    '\u20B9${bikes[index].weekdayHalfPrice}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                    ResponsiveSizedBox.height20,
                    TextStyles.headline(
                      text: 'Customer Feedbacks',
                      color: Appcolors.kgreyColor,
                    ),
                    ResponsiveSizedBox.height10,

                    // Second ListView (Testimonials) with intrinsic height
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ResponsiveUtils.wp(8)),
                          topRight: Radius.circular(ResponsiveUtils.wp(8)),
                        ),
                        color: Appcolors.kwhiteColor,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: IntrinsicHeight(
                          child: Row(
                            children: List.generate(
                              state.dashborddata.testimonials.length,
                              (index) {
                                final testimonials =
                                    state.dashborddata.testimonials;
                                return Container(
                                  width: ResponsiveUtils.wp(60),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: ResponsiveUtils.wp(2),
                                    vertical: ResponsiveUtils.wp(2),
                                  ),
                                  child: QuoteCard(
                                    description:
                                        testimonials[index].testimonial,
                                    name: testimonials[index].customerName,
                                    position:
                                        testimonials[index].customerDesignation,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          } else {
            return SizedBox();
          }
        },
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

  ///
  Widget _buildImageWithFallback({
    required String imageUrl,
    required double width,
    required double height,
    BoxFit fit = BoxFit.cover,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Appcolors.kblackColor,
          size: 20,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported_outlined,
              size: ResponsiveUtils.wp(10),
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Image not available',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: ResponsiveUtils.wp(3),
              ),
            ),
          ],
        ),
      ),
    );
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