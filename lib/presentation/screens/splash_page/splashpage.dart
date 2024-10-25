// import 'package:bright_bike_rentals/core/colors.dart';
// import 'package:bright_bike_rentals/core/images.dart';
// import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     );

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     );

//     _controller.forward();

//     Timer(const Duration(seconds: 3), () {
//       // Navigate to your main screen here
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => ScreenMainPage()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Appcolors.kyellowColor, // Or your app's background color
//       body: Center(
//         child: ScaleTransition(
//           scale: _animation,
//           child: FadeTransition(
//             opacity: _animation,
//             child: Image.asset(
//               AppImages.logo, // Replace with your logo asset path
//               width: 200, // Adjust size as needed
//               height: 200,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/presentation/blocs/settings_bloc/settings_bloc_bloc.dart';

import 'package:bright_bike_rentals/presentation/screens/Mainpage/mainpage.dart';

import 'package:bright_bike_rentals/presentation/widgets/custom_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdvancedSplashScreen extends StatefulWidget {
  const AdvancedSplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdvancedSplashScreenState createState() => _AdvancedSplashScreenState();
}

class _AdvancedSplashScreenState extends State<AdvancedSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _rotationController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween(begin: 1.0, end: 1.2).animate(_pulseController);

    _controller.forward();
    navigate(context);
    context.read<SettingsBlocBloc>().add(SettingsDataInitialFetchingEvent());
  }

  @override
  void dispose() {
    _controller.dispose();
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kwhiteColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background rotating circle
            RotationTransition(
              turns: _rotationController,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Appcolors.kyellowColor,
                      Appcolors.korangeColor.withOpacity(.2)
                    ],
                  ),
                ),
              ),
            ),
            // Pulsing effect
            ScaleTransition(
              scale: _pulseAnimation,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Appcolors.kyellowColor),
              ),
            ),
            // Logo with fade and scale effect
            ScaleTransition(
              scale: _animation,
              child: FadeTransition(
                opacity: _animation,
                child: Image.asset(
                  Appconstants.logo, // Replace with your logo asset path
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigate(context) async {
    await Future.delayed(const Duration(seconds: 3));
    navigatePush(context, ScreenMainPage());
  }
}
