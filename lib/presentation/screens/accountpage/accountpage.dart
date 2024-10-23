import 'package:bright_bike_rentals/core/appconstants.dart';

import 'package:flutter/material.dart';

class ScreenAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(Appconstants.logo),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoCard('Mobile', '+1 123 456 7890'),
            _buildInfoCard('Email', 'johndoe@example.com'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.yellow[600],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            title == 'Mobile' ? Icons.phone : Icons.email,
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}