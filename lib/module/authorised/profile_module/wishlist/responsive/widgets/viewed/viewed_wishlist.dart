import 'package:ecommerce/module/authorised/profile_module/wishlist/controller.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewedWishListScreen extends StatelessWidget {
  const ViewedWishListScreen({super.key, required this.controller});
  final WishlistController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.wishListItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
            child: ProductCard(
              productDetailsPageOnTap: () => controller.onToDetailsPage(context),
                productName: controller.wishListItems[index].itemName,
                currentPrice:
                    controller.wishListItems[index].itemCost.toString(),
                oldPrice:
                    controller.wishListItems[index].previousCost.toString(),
                quantityInfo: "${controller.wishListItems[index].qty}/ KG",
                isFavorite: controller.wishListItems[index].wishList,
                enableActions: true,
                onAddToCart: () => print("Add to cart"),
                onFavoriteToggle: () {
                  controller.wishListItems[index].wishList =
                      !controller.wishListItems[index].wishList;

                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                  print(
                      'wishlist$index =======${controller.wishListItems[index].wishList}');
                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                },
                // image: Image.asset('', fit: BoxFit.cover),
                oldPriceNeeded: false),
          );
        },
      ),
    );
  }
}
