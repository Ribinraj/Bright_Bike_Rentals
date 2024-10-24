import 'package:flutter/material.dart';
import 'package:bright_bike_rentals/core/colors.dart';

class CustomEditingTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const CustomEditingTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Appcolors.kyellowColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Appcolors.kblackColor),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 5),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[400],
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  keyboardType: keyboardType,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
