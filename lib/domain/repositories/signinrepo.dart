import 'dart:convert';
import 'dart:developer';

import 'package:bright_bike_rentals/core/urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SigninRepo {
  static final http.Client client = http.Client();
  //number check
  static Future numbercheck({required String mobilenumber}) async {
    try {
      var response = await client.post(
          Uri.parse('${Endpoints.baseurl}${Endpoints.mobilenumbercheck}'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({'customerMobile': mobilenumber}));

      debugPrint(response.body);
      return response;
    } catch (e) {
      debugPrint(e.toString());
      log(e.toString());
      return 'failed';
    }
  }

  //loginwith password
  static Future passwordlogin(
      {required String mobilenumber, required String password}) async {
    try {
      var response = await client.post(
          Uri.parse('${Endpoints.baseurl}${Endpoints.passwordlogin}'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {'customerMobile': mobilenumber, 'customerPassword': password}));
      debugPrint(response.body);
      return response;
    } catch (e) {
       debugPrint(e.toString());
      log(e.toString());
      return 'failed';
    }
  }
  //loginwithotp
    static Future otplogin(
      {required String mobilenumber}) async {
    try {
      var response = await client.post(
          Uri.parse('${Endpoints.baseurl}${Endpoints.otplogin}'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(
              {'customerMobile': mobilenumber}));
      debugPrint(response.body);
      return response;
    } catch (e) {
       debugPrint(e.toString());
      log(e.toString());
      return 'failed';
    }
  }

}