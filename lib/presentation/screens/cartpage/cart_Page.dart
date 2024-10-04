import 'package:flutter/material.dart';

class ScreenCartPage extends StatefulWidget {
  const ScreenCartPage({super.key});

  @override
  State<ScreenCartPage> createState() => _ScreenCartPageState();
}

class _ScreenCartPageState extends State<ScreenCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('cart'),
      ),
    );
  }
}
