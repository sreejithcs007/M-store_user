import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/view_cart/controller.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/gen/assets.gen.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CartViewMobile extends StatelessWidget {
  const CartViewMobile({
    super.key,
    required this.controller,
  });
  final CartViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(Assets.images.svg.arrowLeft)),
        title: Text('Items in your cart'),
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.cartItems.value.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                child: InkWell(
                  onTap: () => controller.onProductContainerTap(
                      id: controller.cartItems[index].productId, index: index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: _buildRowLayout(index: index),
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subtotal (${controller.cartItems.length} items):",
                      style: AppTextStyle().br16w600),
                  Text("${controller.subtotal.value}",
                      style: AppTextStyle().br24w600),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                ),
                label: Text(
                  "Proceed to Buy",
                  style: AppTextStyle().br16w400.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowLayout({required int index}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Prevent overflow
      children: [
        // Image on the left
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // match Container's radius
            child: (controller.cartItems[index].imageUrl ?? []).isNotEmpty &&
                    controller.cartItems[index].imageUrl!.first.isNotEmpty
                ? Image.network(
                    formatImageUrl(controller.cartItems[index].imageUrl!.first),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 36,
                      color: Colors.grey,
                    ),
                  )
                : Image.asset(
                    'assets/images/defaultimage.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),

        const SizedBox(width: 16),

        // Details next to image
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_buildDetails(index: index)],
          ),
        ),
      ],
    );
  }

  Widget _buildDetails({required int index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product name + favorite
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                controller.cartItems[index].name,
                style: AppTextStyle().br16w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                // isFavorite ? Icons.favorite  //: Icons.favorite_border,
                Icons.favorite,
                // color: isFavorite ? Colors.red : Colors.grey,
                color: Colors.red,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),

        // Price and quantity info
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(controller.cartItems[index].price,
                style:
                    AppTextStyle().br16w600.copyWith(color: Color(0xFFEE9700))),

            // if (oldPrice.isNotEmpty)
            Text(
              " / ${controller.cartItems[index].quantity} ${controller.cartItems[index].unit}",
              style: AppTextStyle().br16w600.copyWith(color: Color(0xFFB3B3B3)),
            ),
          ],
        ),
        const SizedBox(height: 8),

        // Add to cart
        Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.deleteFromCart(
                    index: index, cartId: controller.cartItems[index].id);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFEE9700).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Remove",
                        style: AppTextStyle()
                            .br16w400
                            .copyWith(color: Color(0xFFEE9700))),
                    Gap(10),
                    SvgPicture.asset(Assets.images.svg.delete),
                  ],
                ),
              ),
            ),
            Gap(20),
            IconButton(
              // icon: const Icon(Icons.remove, color: Color(0xFFEE9700)),
              icon: SvgPicture.asset(
                Assets.images.svg.minusSquare,
                color: Color(0xFFEE9700),
              ),
              onPressed: () => controller.decreaseQuantity(index: index),
            ),
            Gap(5),
            Obx(
              () => Text(
                '${controller.cartItems[index].quantity}',
                style:
                    AppTextStyle().br16w600.copyWith(color: Color(0xFF757575)),
              ),
            ),
            Gap(5),
            IconButton(
              icon: SvgPicture.asset(
                Assets.images.svg.add,
                color: Color(0xFFEE9700),
              ),
              onPressed: () => controller.increaseQuantity(index: index),
            ),
          ],
        ),
      ],
    );
  }
}
