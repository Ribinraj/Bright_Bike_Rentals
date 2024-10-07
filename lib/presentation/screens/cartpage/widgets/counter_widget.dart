import 'package:bright_bike_rentals/core/colors.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolors.kyellowColor,
            ),
            child: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: decrement,
              iconSize: 13,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
              ),
              splashRadius: 20,
            ),
          ),
          Text(
            count.toString().padLeft(2, '0'),
          ),
          Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Appcolors.kyellowColor,
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: increment,
              iconSize: 13,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(
                minHeight: 20,
                minWidth: 20,
              ),
              splashRadius: 20,
            ),
          ),
        ],
      ),
    );
  }
}