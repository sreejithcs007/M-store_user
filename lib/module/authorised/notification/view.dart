
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  final notifications = const [

    {
      'iconText': 'Nr',
      'title': 'New order',
      'subtitle': 'ORD 001',
      'color': Colors.orange,
    },
    {
      'iconText': 'Nr',
      'title': 'New order',
      'subtitle': 'ORD 001',
      'color': Colors.orange,
    },
    {
      'iconText': 'Nr',
      'title': 'New order',
      'subtitle': 'ORD 001',
      'color': Colors.orange,
    },
    {
      'iconText': 'Nr',
      'title': 'New order',
      'subtitle': 'ORD 001',
      'color': Colors.orange,
    },

   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        title: Text('Notifications'),
        
        // leading: IconButton(
        //   icon: SvgPicture.asset(.arrowLeft1),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
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
          
          
          final backgroundColor = index % 2 == 0 ? Colors.white : Colors.grey[200];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: backgroundColor,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Text(
                    item['iconText'].toString()!,
                    style: TextStyle(
                      color: item['color'] as Color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                foregroundColor: item['color'] as Color,
              ),
              title: Text(
                item['title'].toString()!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(item['subtitle'].toString()!),
            ),
          );
        },
      ),
    );
  }
}
