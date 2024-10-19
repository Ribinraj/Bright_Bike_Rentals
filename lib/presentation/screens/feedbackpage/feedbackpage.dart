import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';



import 'package:bright_bike_rentals/presentation/screens/homepage/widgets/quates_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenFeedbackPage extends StatefulWidget {
  const ScreenFeedbackPage({super.key});

  @override
  State<ScreenFeedbackPage> createState() => _ScreenFeedbackPageState();
}

class _ScreenFeedbackPageState extends State<ScreenFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kyellowColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kyellowColor,
        title: TextStyles.headline(text: 'Clients Feedback'),
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
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Appcolors.kwhiteColor),
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 8,
            itemBuilder: (context, index) {
              //final item = itemList[index];
              return QuoteCard(
                  title: 'Good Service',
                  description:
                      'fjjjfdsjfjkljsdlfjklsdjfilsd,dfhfofsflsflsdjfklsdjlksjlsl,fhdhfjssshsfhksdfsdfks,fdslfjlsdjflsdjflsdjfsdlfjls',
                  name: 'Ribin',
                  position: 'Developer');
            },
          ),
        ),
      ),
    );
  }
}
