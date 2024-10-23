// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/responsive_utils.dart';
// import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';

// import 'package:bright_bike_rentals/presentation/screens/splash_page/splashpage.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ResponsiveUtils().init(context);
//     return BlocProvider(
//       create: (context) => BottomNavigationbarBloc(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Bright Bike Rentals',
//         theme: ThemeData(
//           fontFamily: 'Helvetica',
//           useMaterial3: true,
//           scaffoldBackgroundColor: Appcolors.kwhiteColor,
//           textSelectionTheme: const TextSelectionThemeData(
//             cursorColor: Appcolors.kblackColor,
//           ),
//         ),
//         home: const AdvancedSplashScreen(),
//       ),
//     );
//   }
// }

//////////////////////////

import 'dart:convert';

import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:bright_bike_rentals/domain/controllers/push_notification_services.dart';
import 'package:bright_bike_rentals/firebase_options.dart';
import 'package:bright_bike_rentals/presentation/blocs/bottom_navigationbar/bottom_navigationbar_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/fetch_dashbord_databloc/fetch_dashbord_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/fetch_profilebloc.dart/fetch_profile_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/otp_bloc/otp_signin_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/password_login_blod.dart/password_login_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/privacy_policy_bloc/privacy_policy_bloc.dart';
import 'package:bright_bike_rentals/presentation/blocs/signin/signin_bloc.dart';

import 'package:bright_bike_rentals/presentation/screens/splash_page/splashpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//functions to listen to background changes
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("some notification received in background");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//initialize firebase messaging
  await Pushnotifications.init();
  //initialize local notifications
  await Pushnotifications.localNotiInit();
  //listen background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
  //on background notification taped
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('background notification tapped');
    }
  });
  //to handle forground notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    String payloadData = jsonEncode(message.data);
    print('got a message from foreground');
    if (message.notification != null) {
      Pushnotifications.showSimpleNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: payloadData);
    }
  });
  //for handling terminated state\
  final RemoteMessage? message =
      await FirebaseMessaging.instance.getInitialMessage();
  if (message != null) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveUtils().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationbarBloc>(
          create: (context) => BottomNavigationbarBloc(),
        ),
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc()..add(CheckConnectivity()),
        ),
        BlocProvider<SigninBloc>(
          create: (context) => SigninBloc(),
        ),
        BlocProvider<PasswordLoginBloc>(
          create: (context) => PasswordLoginBloc(),
        ),
        BlocProvider<OtpSigninBloc>(
          create: (context) => OtpSigninBloc(),
        ),
        BlocProvider<FetchDashbordBloc>(
          create: (context) => FetchDashbordBloc(),
        ),
        BlocProvider<FetchProfileBloc>(
          create: (context) => FetchProfileBloc(),
        ),
         BlocProvider<PrivacyPolicyBloc>(
          create: (context) => PrivacyPolicyBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bright Bike Rentals',
        theme: ThemeData(
          fontFamily: 'Helvetica',
          useMaterial3: true,
          scaffoldBackgroundColor: Appcolors.kwhiteColor,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Appcolors.kblackColor,
          ),
        ),
        home: const AdvancedSplashScreen(),
      ),
    );
  }
}
