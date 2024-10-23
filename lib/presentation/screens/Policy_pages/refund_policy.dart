import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/data/policy_model.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';


class ScreenRefundPolicyPage extends StatelessWidget {
  final PolicyModel policy;
  const ScreenRefundPolicyPage({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Refund Policy',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Appcolors.kyellowColor,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              size: 35,
            )),
      ),
      body:  SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: HtmlWidget(
                policy.policy,
                customStylesBuilder: (element) {
                  if (element.localName == 'h3') {
                    return {
                      'font-size': '20px',
                      'font-weight': 'bold',
                      'margin': '16px 0 8px 0'
                    };
                  }
                  if (element.localName == 'ul') {
                    return {'margin-left': '16px'};
                  }
                  if (element.localName == 'li') {
                    return {'margin-bottom': '8px'};
                  }
                  return null;
                },
              ),
            ));
          } 
        }
 
