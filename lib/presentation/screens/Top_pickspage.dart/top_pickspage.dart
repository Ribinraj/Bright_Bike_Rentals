import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/fetch_dashbord_databloc/fetch_dashbord_bloc.dart';
import 'package:bright_bike_rentals/presentation/screens/notificationpage/notificationpage.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_callingbutton.dart';
import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenTopPickspage extends StatelessWidget {
  final FetchDashbordDataSuccessState state;
  const ScreenTopPickspage({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Appcolors.kwhiteColor,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.chevron_back,
            size: 33,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: ResponsiveUtils.wp(1)),
              child:  PhoneCallButton()),
          IconButton(
              onPressed: () {
                navigatePush(context, NotificationPage());
              },
              icon: const Icon(
                Icons.notifications,
                color: Appcolors.kblackColor,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: TextStyles.headline(
                text: 'Top Fleets', color: Appcolors.kgreyColor),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(ResponsiveUtils.wp(4)),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing:
                    ResponsiveUtils.wp(3), // Space between columns
                mainAxisSpacing: ResponsiveUtils.wp(3), // Space between rows
              ),
              itemCount: state.dashborddata.bikes.length,
              itemBuilder: (context, index) {
                final bikes = state.dashborddata.bikes;
                return Container(
                  padding:
                      EdgeInsets.all(ResponsiveUtils.wp(2)), // Reduced padding
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(ResponsiveUtils.wp(2)),
                    border: Border.all(
                        width: 1, color: Appcolors.kgreyColor.withOpacity(.6)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Reduced padding for the title
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveUtils.wp(2),
                          vertical: ResponsiveUtils.wp(1),
                        ),
                        child: Text(
                          bikes[index].bikeName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveUtils.wp(3.5),
                          ),
                          maxLines:
                              1, // Changed to 1 line to give more space to image
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Expanded with flex to give more space to the image
                      Expanded(
                        flex: 4, // Increased flex factor for larger image
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveUtils.wp(2),
                            vertical: ResponsiveUtils.wp(1),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(ResponsiveUtils.wp(2)),
                            child: _buildImageWithFallback(
                              imageUrl: bikes[index].bikePicture,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      // Price row with reduced padding
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveUtils.wp(2),
                          vertical: ResponsiveUtils.wp(1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextStyles.caption(
                              text: 'Starts from :',
                              color: Appcolors.kgreyColor,
                            ),
                            ResponsiveSizedBox.width10,
                            TextStyles.body(
                              text: '\u20B9${bikes[index].weekdayHalfPrice}',
                            ),
                          ],
                        ),
                      ),
                      // Book now button
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ResponsiveUtils.hp(1)),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Appcolors.kyellowColor.withOpacity(.8),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: TextStyles.caption(
                            text: 'Book now',
                            weight: FontWeight.bold,
                            color: Appcolors.kblackColor,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
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
