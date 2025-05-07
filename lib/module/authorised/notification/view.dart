// import 'package:ecommerce/module/authorised/notification/widget/notification_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class NotificationPage extends StatelessWidget {
//   final controller = Get.put(NotificationController());

//   NotificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Notifications'),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       backgroundColor: Colors.grey.shade100,
//       body: Obx(() {
//         final items = controller.notifications;
//         return ListView.separated(
//           itemCount: items.length,
//           separatorBuilder: (_, __) => Container(
//             height: 1,
//             color: Colors.grey.shade200,
//           ),
//           itemBuilder: (context, index) {
//             final item = items[index];
//             return NotificationTile(
//               data: item,
//             );
//           },
//         );
//       }),
//     );
//   }
// }
