import 'package:ecommerce/module/authorised/profile_module/my_orders/controller.dart';
import 'package:ecommerce/widget/custom_card_for_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrderViewScreen extends StatelessWidget {
  const MyOrderViewScreen({super.key, required this.controller});
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.orderedList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
            child: MyOrderCard(
              orderId: controller.trackingList[index].orderId,

              productName: controller.orderedList[index].itemName,
              currentPrice: controller.orderedList[index].itemRate.toString(),
              quantityInfo: "${controller.orderedList[index].itemQty}/ KG",
              // isFavorite: controller.orderedList[index].deliveryStatus,
              enableActions: true,
              onAddToCart: () => print("Add to cart"),
              deliveryStatus: controller.orderedList[index].deliveryStatus,
            ),
          );
        },
      ),
    );
  }
}
