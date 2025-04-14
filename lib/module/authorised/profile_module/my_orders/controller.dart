import 'package:ecommerce/module/authorised/profile_module/my_orders/widget/order_details_page/order_details_page.dart';
import 'package:ecommerce/shared/model/my_order_model/my_order_model.dart';
import 'package:ecommerce/widget/custom_details_page/custom_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderController extends GetxController {
  RxList<MyOrderModel> orderedList = <MyOrderModel>[
    MyOrderModel(
        itemName: 'tomato',
        itemQty: 100,
        itemRate: 29,
        orderId: '1234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'onion',
        itemQty: 100,
        itemRate: 29,
        orderId: '1321',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carrot',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'delivered',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carror',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carror',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
  ].obs;
  RxList<MyOrderModel> trackingList = <MyOrderModel>[
    MyOrderModel(
        itemName: 'tomato',
        itemQty: 100,
        itemRate: 29,
        orderId: '1234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'onion',
        itemQty: 100,
        itemRate: 29,
        orderId: '1321',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carrot',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carror',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
    MyOrderModel(
        itemName: 'carror',
        itemQty: 100,
        itemRate: 29,
        orderId: '11234',
        paymentType: 1,
        createdAt: 1234567,
        deliveryStatus: 'ongoing',
        itemOrderId: ''),
  ].obs;

  void onToDetailsPage(BuildContext context) {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderDetailsPageScreen()),
            );
  }
}
