import 'package:ecommerce/module/authorised/profile_module/my_orders/controller.dart';
import 'package:ecommerce/widget/custom_card_for_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackinOrderViewScreen extends StatelessWidget {
  const TrackinOrderViewScreen({super.key, required this.controller});
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.trackingList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
            child: MyOrderCard(
              containerOntap: () => controller.onToDetailsPage(context,id: 1),
              orderId: controller.trackingList[index].orderId,
              productName: controller.trackingList[index].itemName,
              currentPrice: controller.trackingList[index].itemRate.toString(),
              quantityInfo: "${controller.trackingList[index].itemQty}/ KG",
              enableActions: true,
              onAddToCart: () => print("Add to cart"),
              deliveryStatus: controller.trackingList[index].deliveryStatus,
              orderDate: '',
            ),
          );
        },
      ),
    );
  }
}
