import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/responsive_utils.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  //final String title;
  final String description;
  final String name;
  final String position;

  const QuoteCard({
    super.key,
    // required this.title,
    required this.description,
    required this.name,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtils.wp(60),
      margin: EdgeInsets.only(right: ResponsiveUtils.wp(2)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Content
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   title.toUpperCase(),
                //   style: const TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //     color: Color(0xFF2A9D8F),
                //   ),
                // ),
                // const SizedBox(height: 12),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  softWrap: true,
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  position,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          // Decorative elements
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: Appcolors.kthemegreen,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 12,
            left: 16,
            child: Text(
              '"',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
