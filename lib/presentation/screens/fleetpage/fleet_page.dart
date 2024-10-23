import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/presentation/blocs/fetch_dashbord_databloc/fetch_dashbord_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScreenFleetPage extends StatelessWidget {
  const ScreenFleetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kyellowColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kyellowColor,
        title: TextStyles.headline(text: 'Our Tariff'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              size: 35,
            )),
      ),
      body: BlocBuilder<FetchDashbordBloc, FetchDashbordState>(
        builder: (context, state) {
          if (state is FetchDashbordDataLoadingState) {
            return Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                  color: Appcolors.kyellowColor, size: 30),
            );
          }
          if (state is FetchDashbordDataSuccessState) {
            return Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Appcolors.kbackgroundgrey),
                child: ListView.builder(
                    padding: EdgeInsets.all(ResponsiveUtils.wp(8)),
                    itemCount: state.dashborddata.bikes.length,
                    itemBuilder: (context, index) {
                      final bikes = state.dashborddata.bikes;
                      return Container(
                        padding: const EdgeInsets.all(10),
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
                            ResponsiveSizedBox.height20,
                            SizedBox(
                              width: ResponsiveUtils.wp(60),
                              height: ResponsiveUtils.hp(15),
                              child: Image.asset(
                                'assets/images/moto-food-delivery-man-rides-motor-bike-with-thermal-backpack-food-deliver-service-generative-ai.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: ResponsiveUtils.hp(1.5)),
                            TextStyles.subheadline(
                              text: bikes[index].bikeName,
                              weight: FontWeight.bold,
                            ),
                            TextStyles.caption(
                                text: 'Starting from', weight: FontWeight.bold),
                            ResponsiveSizedBox.height5,
                            Container(
                              // ignore: prefer_const_constructors
                              decoration: BoxDecoration(
                                color: Appcolors.kyellowColor.withOpacity(.8),
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
                                      const Spacer(),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ResponsiveText(
                                            'Monday - Thursday',
                                            weight: FontWeight.bold,
                                            sizeFactor: .9,
                                            color: Appcolors.kblackColor,
                                          ),
                                          ResponsiveText(
                                            'Friday - Sunday',
                                            weight: FontWeight.bold,
                                            sizeFactor: .9,
                                            color: Appcolors.kblackColor,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 2,
                                        color: Appcolors.kgreyColor,
                                        height: ResponsiveUtils.wp(13),
                                        margin: EdgeInsets.symmetric(
                                          horizontal: ResponsiveUtils.wp(5),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextStyles.body(
                                              text:
                                                  '\u20B9${bikes[index].weekdayFullPrice}',
                                              weight: FontWeight.bold),
                                          TextStyles.body(
                                              text:
                                                  '\u20B9${bikes[index].holidayFullPrice}',
                                              weight: FontWeight.bold)
                                        ],
                                      ),
                                      const Spacer()
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      );
                    }));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
