import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/controller.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WishlistViewScreen extends StatelessWidget {
  const WishlistViewScreen({super.key, required this.controller});
  final WishlistController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.wishListItems.value.isEmpty
          ? Center(child: Lottie.asset('assets/animation/Anime1.json'))
          : ListView.builder(
              itemCount: controller.wishListItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                  child: ProductCard(
                      productDetailsPageOnTap: () => controller.onToDetailsPage(
                          context,
                          id: controller.wishListItems[index].productId),
                      productName: controller.wishListItems[index].name,
                      currentPrice:
                          controller.wishListItems[index].price.toString(),
                      oldPrice: '0',
                      quantityInfo:
                          "/ 1 ${controller.wishListItems[index].unit}",
                      isFavorite: controller.wishListItems[index].isFavorite,
                      onAddToCart: () => controller.onAddToCartTap(context,
                          productId: controller.wishListItems[index].productId,
                          quantity:
                              controller.wishListItems[index].quantity ?? 1),
                      onFavoriteToggle: () {
                        controller.onFavoriteToggle(index: index);
                      },
                      image: Image.network(
                        formatImageUrl(
                            controller.wishListItems[index].imageUrl?.first),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.image,
                          size: 36,
                          color: Colors.grey,
                        ),
                      ),
                      oldPriceNeeded: false),
                );
              },
            ),
    );
  }
}
