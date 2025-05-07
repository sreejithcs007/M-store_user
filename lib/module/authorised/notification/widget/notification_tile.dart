import 'package:ecommerce/module/authorised/notification/model/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final AppNotification data;

  const NotificationTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: data.color.withOpacity(.15),   
          child: Text(
            data.code,
            style: TextStyle(fontWeight: FontWeight.bold, color: data.color),
          ),
        ),
        title: Text(
          data.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          data.subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
