
import 'dart:developer';

import 'package:bright_bike_rentals/core/urls.dart';
import 'package:bright_bike_rentals/presentation/widgets/sharedprefernce.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashbordrepo {
  static final http.Client client = http.Client();

  static Future fetchdashborddata() async {
    final token = await getUserToken();

    try {
      var response = await client.post(
        Uri.parse('${Endpoints.baseurl}${Endpoints.dashbord}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
      );

      
      return response;
    } catch (e) {
      debugPrint(e.toString());
      log(e.toString());
      return 'failed';
    }
  }
}