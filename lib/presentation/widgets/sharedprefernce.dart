import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getUserToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString('USER_TOKEN')??'';
}
Future<void> initializePhoneNumber() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? fetchedNumber = preferences.getString('BUSINESSPHONENUMBER') ?? '';
  Appconstants.phonenumber = fetchedNumber; // Assign it to the static variable
}