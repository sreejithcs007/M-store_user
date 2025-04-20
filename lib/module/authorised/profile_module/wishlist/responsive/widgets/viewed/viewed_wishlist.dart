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
                productDetailsPageOnTap: () =>
                    controller.onToDetailsPage(context,id: 1),
                productName: controller.viewdWishListItems[index].itemName,
                currentPrice:
                    controller.viewdWishListItems[index].itemCost.toString(),
                oldPrice:
                    controller.viewdWishListItems[index].previousCost.toString(),
                quantityInfo: "${controller.viewdWishListItems[index].qty}/ KG",
                isFavorite: controller.viewdWishListItems[index].wishList,
                enableActions: true,
                onAddToCart: () => print("Add to cart"),
                onFavoriteToggle: () {
                  controller.viewdWishListItems[index].wishList =
                      !controller.viewdWishListItems[index].wishList;

                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                  print(
                      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
                  print(
                      'wishlist$index =======${controller.viewdWishListItems[index].wishList}');
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
