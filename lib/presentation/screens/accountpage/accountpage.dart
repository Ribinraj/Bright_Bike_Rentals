import 'package:flutter/material.dart';

class ScreenAccountPage extends StatefulWidget {
  const ScreenAccountPage({super.key});

  @override
  State<ScreenAccountPage> createState() => _ScreenAccountPageState();
}

class _ScreenAccountPageState extends State<ScreenAccountPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('accountpage'),
    );
  }
}
