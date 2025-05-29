import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/shared/repo/authorised/notification/repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, Object>> notifications = [];
  final repo = NotificationRepo();

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  void loadNotifications() async {
    final value = await repo.getAllNotification();
    setState(() {
      notifications = value
          .map<Map<String, Object>>((e) => {
                'iconText': e.status == "unread" ? "UR" : "R",
                'title': e.title ?? '',
                'subtitle': e.message ?? '',
                'color': e.status == "unread" ? Colors.blue : Colors.grey,
              })
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Notifications', style: AppTextStyle().br16w400),

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   TextButton.icon(
        //     onPressed: () {},
        //     icon: const Icon(Icons.remove_red_eye_outlined, color: Colors.orange),
        //     label: const Text(
        //       'Mark as read all',
        //       style: TextStyle(color: Colors.orange),
        //     ),
        //   ),
        // ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final item = notifications[index];

          final backgroundColor =
              index % 2 == 0 ? Colors.white : Colors.grey[200];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: backgroundColor,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                foregroundColor: item['color'] as Color,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Text(
                    item['iconText'].toString(),
                    style: TextStyle(
                      color: item['color'] as Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              title: Text(
                item['title'].toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle'].toString()),
            ),
          );
        },
      ),
    );
  }
}
