

// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/constants.dart';
// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:bright_bike_rentals/presentation/screens/cartpage/widgets/pickup_custom_container.dart';
// import 'package:flutter/material.dart';

// class Topcontainer extends StatelessWidget {
//   const Topcontainer({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Appcolors.kbackgroundgrey,
//             borderRadius: BorderRadiusStyles.kradius20(),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10),
//             child: Column(
//               children: List.generate(3, (index) {
//                 return Padding(
//                   padding: EdgeInsets.only(bottom: ResponsiveUtils.wp(4)),
//                   child: Container(
//                     padding: const EdgeInsets.all(8),
//                     height: 105,
//                     decoration: BoxDecoration(
//                       color: Appcolors.kwhiteColor,
//                       border: Border.all(
//                         color: Appcolors.kyellowColor,
//                         width: 1.5,
//                       ),
//                       borderRadius: BorderRadiusStyles.kradius10(),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           offset: const Offset(0, 4),
//                           blurRadius: 2,
//                           spreadRadius: 0,
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               SizedBox(
//                                 width: ResponsiveUtils.wp(12),
//                                 height: ResponsiveUtils.hp(5.5),
//                                 child: Image.asset(
//                                   'assets/images/bicycle-wheel-against-sky-sunset.jpg',
//                                   fit: BoxFit.contain,
//                                 ),
//                               ),
//                               ResponsiveSizedBox.height10,
//                               TextStyles.caption(
//                                   text: 'Activa 4G BS4',
//                                   weight: FontWeight.bold,
//                                   color: Appcolors.kblackColor)
//                             ],
//                           ),
//                           ResponsiveSizedBox.width10,
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextStyles.caption(
//                                 text: 'Pickup',
//                               ),
//                               Row(
//                                 children: [
//                                   TextStyles.caption(
//                                       text: '23 March 2024 ',
//                                       color: Appcolors.kblackColor),
//                                   TextStyles.caption(
//                                       text: '09:00 AM',
//                                       color: Appcolors.kblackColor),
//                                 ],
//                               ),
//                               TextStyles.caption(
//                                 text: 'Drop off',
//                               ),
//                               Row(
//                                 children: [
//                                   TextStyles.caption(
//                                       text: '23 March 2024 ',
//                                       color: Appcolors.kblackColor),
//                                   TextStyles.caption(
//                                       text: '09:00 AM',
//                                       color: Appcolors.kblackColor),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               ResponsiveSizedBox.height10,
//                               TextStyles.subheadline(
//                                 text: '\u20B9 500',
//                               ),
//                               ResponsiveSizedBox.height10,
//                               CounterWidget()
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

////


class Topcontainer extends StatefulWidget {
  const Topcontainer({
    super.key,
  });

  @override
  State<Topcontainer> createState() => _TopcontainerState();
}

class _TopcontainerState extends State<Topcontainer> {
  List<int> counts = [1, 1, 1]; // Initialize counts for each container

  void increment(int index) {
    setState(() {
      counts[index]++;
    });
  }

  void decrement(int index) {
    if (counts[index] > 1) {
      setState(() {
        counts[index]--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Appcolors.kbackgroundgrey,
            borderRadius: BorderRadiusStyles.kradius20(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: List.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: ResponsiveUtils.wp(4)),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    height: 105,
                    decoration: BoxDecoration(
                      color: Appcolors.kwhiteColor,
                      border: Border.all(
                        color: Appcolors.kyellowColor,
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
                    child: Padding(
                      padding: EdgeInsets.all(ResponsiveUtils.wp(1)),
                      child: Row(
                        children: [
                           Column(
                            children: [
                              SizedBox(
                                width: ResponsiveUtils.wp(12),
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
                                  color: Appcolors.kblackColor)
                            ],
                          ),
                          ResponsiveSizedBox.width10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextStyles.caption(
                                text: 'Pickup',
                              ),
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
                              TextStyles.caption(
                                text: 'Drop off',
                              ),
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
                          // ... other widgets remain the same ...
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ResponsiveSizedBox.height10,
                              TextStyles.subheadline(
                                text: '\u20B9 500',
                              ),
                              ResponsiveSizedBox.height10,
                              // Counter directly integrated here
                              SizedBox(
                                width: 65,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Appcolors.kyellowColor,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () => decrement(index),
                                        iconSize: 13,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(
                                          minHeight: 20,
                                          minWidth: 20,
                                        ),
                                        splashRadius: 20,
                                      ),
                                    ),
                                    Text(
                                      counts[index].toString().padLeft(2, '0'),
                                    ),
                                    Container(
                                      width: 18,
                                      height: 18,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Appcolors.kyellowColor,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () => increment(index),
                                        iconSize: 13,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(
                                          minHeight: 20,
                                          minWidth: 20,
                                        ),
                                        splashRadius: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}