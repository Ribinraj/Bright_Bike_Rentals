
import 'dart:developer';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';

class PhoneCallButton extends StatelessWidget {
  final String phoneNumber = '+9-19845627893';
  const PhoneCallButton({super.key});

Future<void> _makePhoneCall(BuildContext context) async {
  try {
    if (Platform.isAndroid) {
      final Uri phoneUri = Uri.parse('tel:$phoneNumber');
      final String telUrl = 'tel:${Uri.encodeComponent(phoneNumber)}';
      
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(
          phoneUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        // Fallback for some Android devices
        final Uri fallbackUri = Uri.parse(telUrl);
        if (await canLaunchUrl(fallbackUri)) {
          await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
        } else {
          throw 'Could not launch phone app';
        }
      }
    } else {
      // iOS and other platforms
      final Uri phoneUri = Uri.parse('tel:$phoneNumber');
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        throw 'Could not launch phone app';
      }
    }
  } catch (e) {
    log('Error launching phone app: $e');
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _makePhoneCall(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Appcolors.kyellowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyles.kradius20(),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.wp(3),
          vertical: ResponsiveUtils.hp(1)
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.phone_in_talk_outlined,
              color: Appcolors.kblackColor),
          const SizedBox(width: 5),
          Text(
            phoneNumber,
            style: const TextStyle(
              color: Appcolors.kblackColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}