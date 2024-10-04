import 'package:flutter/material.dart';

class ScreenBookingPage extends StatefulWidget {
  const ScreenBookingPage({super.key});

  @override
  State<ScreenBookingPage> createState() => _ScreenBookingPageState();
}

class _ScreenBookingPageState extends State<ScreenBookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('bookingpage'),
      ),
    );
  }
}
