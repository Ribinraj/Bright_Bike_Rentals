// location_utils.dart
import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:bright_bike_rentals/data/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationUtils {
  // Extract coordinates from Google Maps iframe string
  static (double, double)? extractCoordinates(String iframeString) {
    try {
      final RegExp coordRegex = RegExp(r'!3d(-?\d+\.\d+)!2d(-?\d+\.\d+)');
      final match = coordRegex.firstMatch(iframeString);
      
      if (match != null && match.groupCount == 2) {
        final lat = double.parse(match.group(1)!);
        final lng = double.parse(match.group(2)!);
        return (lat, lng);
      }
      
      // Alternative regex for different iframe format
      final RegExp altRegex = RegExp(r'!1m2!1s0x[0-9a-f]+!2d(-?\d+\.\d+)!3d(-?\d+\.\d+)');
      final altMatch = altRegex.firstMatch(iframeString);
      
      if (altMatch != null && altMatch.groupCount == 2) {
        final lat = double.parse(altMatch.group(2)!);
        final lng = double.parse(altMatch.group(1)!);
        return (lat, lng);
      }
      
      return null;
    } catch (e) {
      return null;
    }
  }

  // Launch map with coordinates
  static Future<void> openMapWithCoordinates(double lat, double lng) async {
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  // Launch map with address
  static Future<void> openMapWithAddress(String address) async {
    final encodedAddress = Uri.encodeComponent(address);
    final Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encodedAddress');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}

// location_button.dart


class LocationButton extends StatelessWidget {
  final SettingsDataModel settingsData;
  
  const LocationButton({
    super.key,
    required this.settingsData,
  });

  Future<void> _handleLocationPress() async {
    try {
      // Try to extract coordinates first
      final coordinates = LocationUtils.extractCoordinates(settingsData.businessGoogleMap);
      
      if (coordinates != null) {
        // If coordinates found, use them
        await LocationUtils.openMapWithCoordinates(coordinates.$1, coordinates.$2);
      } else {
        // Fallback to address
        await LocationUtils.openMapWithAddress(settingsData.businessAddress);
      }
    } catch (e) {
      debugPrint('Error opening map: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _handleLocationPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyles.kradius10(),
        ),
        backgroundColor: Appcolors.kyellowColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_location_alt_outlined,
              color: Appcolors.kblackColor,
            ),
            ResponsiveSizedBox.width30,
            const Text(
              'Locate Us',
              style: TextStyle(color: Appcolors.kblackColor),
            )
          ],
        ),
      ),
    );
  }
}