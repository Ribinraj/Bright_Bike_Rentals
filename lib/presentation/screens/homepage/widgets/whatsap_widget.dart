import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsAppButton extends StatelessWidget {
  final String phoneNumber;

  const WhatsAppButton({super.key, required this.phoneNumber});

  void launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumber";
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: launchWhatsApp,
      child: Text('Message on WhatsApp'),
    );
  }
}