import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/controller.dart';
import 'package:ecommerce/widget/custom_card_for_orders/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MyOrderViewScreen extends StatelessWidget {
  const MyOrderViewScreen({super.key, required this.controller});
  final MyOrderController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.orderedList.value.isEmpty
          ? Center(child: Lottie.asset('assets/animation/Anime1.json'))
          : ListView.builder(
              itemCount: controller.orderedList.value.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                  child: MyOrderCard(
                    containerOntap: () => controller.onToDetailsPage(context,
                        id: int.tryParse(
                            controller.orderedList[index].orderId)!),
                    orderId: controller.orderedList[index].orderId,
                    productName: controller.orderedList[index].itemName,
                    currentPrice:
                        controller.orderedList[index].itemRate.toString(),
                    quantityInfo: "${controller.orderedList[index].itemQty} KG",
                    // isFavorite: controller.orderedList[index].deliveryStatus,
                    enableActions: true,
                    onAddToCart: () => print("Add to cart"),
                    deliveryStatus:
                        controller.orderedList[index].deliveryStatus,
                    image: Image.network(
                      formatImageUrl(
                          controller.orderedList[index].imageUrl.first),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image,
                        size: 36,
                        color: Colors.grey,
                      ),
                    ),
                    paymentType: controller.orderedList[index].paymentType,
                    orderDate: controller.orderedList[index].createdAt,
                  ),
                );
              },
            ),
    );
  }
}
