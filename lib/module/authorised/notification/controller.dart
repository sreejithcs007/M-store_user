// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'app_notification.dart';

// class NotificationController extends GetxController {
//   final notifications = <AppNotification>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadDummyNotifications();
//   }

//   void loadDummyNotifications() {
//     notifications.value = [
//       AppNotification(id: 1, code: 'CR', title: 'New Customer Added', subtitle: 'Lorem ipsum sample text here'),
//       AppNotification(id: 2, code: 'PR', title: 'Product Purchased', subtitle: 'Lorem ipsum sample text here'),
//       AppNotification(id: 3, code: 'DR', title: 'Discount Related', subtitle: 'Lorem ipsum sample text here'),
//       AppNotification(id: 4, code: 'PG', title: 'Payment Received', subtitle: 'Lorem ipsum sample text here'),
//       AppNotification(id: 5, code: 'DP', title: 'Delivery boy changed address', subtitle: 'Lorem ipsum sample text here'),
//       AppNotification(id: 6, code: 'OR', title: 'Others', subtitle: 'Lorem ipsum sample text here'),
//     ];
//   }

//   Color getColor(String code) {
//     switch (code) {
//       case 'CR': return Colors.green;
//       case 'PR': return Colors.red;
//       case 'DR': return Colors.orange;
//       case 'PG': return Colors.pink;
//       case 'DP': return Colors.grey;
//       case 'OR': return Colors.amber.shade700;
//       default: return Colors.blueGrey;
//     }
//   }
// }
