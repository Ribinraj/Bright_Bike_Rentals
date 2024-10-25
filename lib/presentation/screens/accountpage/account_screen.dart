import 'package:bright_bike_rentals/core/appconstants.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

// Previous WaveClipper class remains the same...
class WaveClipper extends CustomClipper<Path> {
  final double animation;
  final int waveLayer;

  WaveClipper(this.animation, this.waveLayer);

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);

    // Make only 2-3 large waves across the screen
    double x = 0;
    double y = 0;

    // Customize wave parameters for larger, smoother curves
    double amplitude = waveLayer == 1
        ? 60
        : waveLayer == 2
            ? 45
            : 35;
    // Reduce frequency for larger waves (only 2-3 waves across screen)
    double frequency = size.width /
        (waveLayer == 1
            ? 1.5
            : waveLayer == 2
                ? 2
                : 2.5);
    // Phase shift for each layer
    double phase = waveLayer == 1
        ? 0
        : waveLayer == 2
            ? math.pi / 2
            : math.pi;

    while (x < size.width) {
      // Using smoother sine wave with adjusted parameters
      y = amplitude *
          math.sin((x / frequency) + animation * 2 * math.pi + phase);
      path.lineTo(x, size.height * 0.35 + y);
      x += 1;
    }

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) => true;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              // Previous wave layers remain the same...
              // First wave layer
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return ClipPath(
                    clipper: WaveClipper(_animationController.value, 1),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Appcolors.kyellowColor.withOpacity(.5),
                            Appcolors.kwhiteColor,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              // Second wave layer
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return ClipPath(
                    clipper: WaveClipper(_animationController.value, 2),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Appcolors.kyellowColor.withOpacity(.3),
                            Appcolors.kwhiteColor,
                          ],
                        ),
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  );
                },
              ),
              // Third wave layer
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return ClipPath(
                    clipper: WaveClipper(_animationController.value, 3),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Appcolors.kyellowColor,
                            Appcolors.kyellowColor.withOpacity(.2)
                          ],
                        ),
                      ),
                      child: Container(
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  );
                },
              ),

              Positioned(
                bottom: ResponsiveUtils.hp(
                    12), // Adjust this value to position the content
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      Appconstants.logo, // Update this path to match your asset
                      height: ResponsiveUtils.hp(25), // Adjust size as needed
                      width: ResponsiveUtils.wp(65),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: ResponsiveUtils.hp(6),
            width: ResponsiveUtils.wp(80),
            decoration: BoxDecoration(
              color: Appcolors.kblackColor,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  width: 1, color: Appcolors.kgreyColor.withOpacity(.5)),
            ),
            child: Center(
              child: TextStyles.body(
                text: 'Login',
                color: Appcolors.kwhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
