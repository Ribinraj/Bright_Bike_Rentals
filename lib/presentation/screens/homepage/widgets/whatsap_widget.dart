import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton extends StatelessWidget {
  final String phoneNumber;

  const WhatsAppButton({super.key, required this.phoneNumber});

  void launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumber";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: launchWhatsApp,
      child: Text('Message on WhatsApp'),
    );
  }
}
/////
    // Column(
    //           children: List.generate(
    //             itemList.length,
    //             (index) {
    //               final item = itemList[index];
    //               return Column(
    //                 children: [
    //                   Container(
    //                     margin: EdgeInsets.only(bottom: ResponsiveUtils.wp(3)),
    //                     width: double.infinity,
    //                     // height: ResponsiveUtils.hp(15),
    //                     decoration: BoxDecoration(
    //                       gradient: const LinearGradient(
    //                         colors: [
    //                           Appcolors.kbackgroundgrey,
    //                           Appcolors.kwhiteColor,
    //                         ],
    //                         begin: Alignment.topLeft, // Gradient starting point
    //                         end: Alignment.bottomRight, // Gradient ending point
    //                       ),
    //                       border: Border.all(
    //                         color: Appcolors.kyellowColor.withOpacity(.6),
    //                         width: 1.3,
    //                       ),
    //                       borderRadius: BorderRadiusStyles.kradius10(),
    //                       boxShadow: [
    //                         BoxShadow(
    //                           color: Appcolors.kgreyColor.withOpacity(0.2),
    //                           offset: const Offset(0, 4),
    //                           blurRadius: 2,
    //                           spreadRadius: 0,
    //                         ),
    //                       ],
    //                     ),
    //                     child: Padding(
    //                       padding: EdgeInsets.all(ResponsiveUtils.wp(2)),
    //                       child: Row(
    //                         children: [
    //                           SizedBox(
    //                             width: ResponsiveUtils.wp(30),
    //                             height: ResponsiveUtils.hp(13),
    //                             child: Image.asset(
    //                               item['image']!,
    //                               fit: BoxFit.contain,
    //                             ),
    //                           ),
    //                           ResponsiveSizedBox.width10,
    //                           Column(
    //                             crossAxisAlignment: CrossAxisAlignment.start,
    //                             children: [
    //                               TextStyles.subheadline(
    //                                 text: item['title']!,
    //                               ),
    //                               TextStyles.caption(
    //                                   text: 'Starts from',
    //                                   weight: FontWeight.w600),
    //                               Row(
    //                                 children: [
    //                                   const Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       ResponsiveText(
    //                                         'Monday-Thursday',
    //                                         weight: FontWeight.bold,
    //                                         sizeFactor: .9,
    //                                       ),
    //                                       ResponsiveText(
    //                                         'Friday-Sunday',
    //                                         weight: FontWeight.bold,
    //                                         sizeFactor: .9,
    //                                       ),
    //                                     ],
    //                                   ),
    //                                   Container(
    //                                     width: 2,
    //                                     color: Appcolors.kblackColor,
    //                                     height: ResponsiveUtils.wp(13),
    //                                     margin: EdgeInsets.symmetric(
    //                                       horizontal: ResponsiveUtils.wp(3),
    //                                     ),
    //                                   ),
    //                                   Column(
    //                                     crossAxisAlignment:
    //                                         CrossAxisAlignment.start,
    //                                     mainAxisAlignment:
    //                                         MainAxisAlignment.spaceBetween,
    //                                     children: [
    //                                       TextStyles.body(
    //                                           text: item['price1']!,
    //                                           weight: FontWeight.bold),
    //                                       TextStyles.body(
    //                                           text: item['price2']!,
    //                                           weight: FontWeight.bold)
    //                                     ],
    //                                   )
    //                                 ],
    //                               )
    //                             ],
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   ResponsiveSizedBox.height10
    //                 ],
    //               );
    //             },
    //           ),
    //         )