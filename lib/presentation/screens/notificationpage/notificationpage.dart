import 'package:bright_bike_rentals/core/colors.dart';
import 'package:bright_bike_rentals/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification {
  final String title;
  final String content;
  final DateTime date;

  Notification(
      {required this.title, required this.content, required this.date});
}

class NotificationPage extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(
      title: "New message",
      content: "You have a new message from John",
      date: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    Notification(
      title: "Friend request",
      content: "Sarah sent you a friend request",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Notification(
      title: "New comment",
      content: "Someone commented on your post",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
  ];

  NotificationPage({super.key});

  String getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) return "Today";
    if (difference.inDays == 1) return "Yesterday";
    if (difference.inDays < 7) return "${difference.inDays} days ago";
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.kyellowColor,
      appBar: AppBar(
        backgroundColor: Appcolors.kyellowColor,
        title: TextStyles.headline(text: 'Notifications'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              CupertinoIcons.chevron_back,
              size: 35,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 5),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Appcolors.kwhiteColor),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 15),
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Card(
              color: Appcolors.kbackgroundgrey,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  notification.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.content),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          getRelativeTime(notification.date),
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
