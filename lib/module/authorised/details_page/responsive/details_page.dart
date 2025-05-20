import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/details_page/controller.dart';
import 'package:ecommerce/widget/cutsom_carousel/custom_carousel.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductDetailController controller;

  const ProductDetailScreen({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Product Detail", style: AppTextStyle().br16w600),
          leading: const BackButton(color: Color(0xFFEE9700)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Obx(
                  () => SimpleCarousel(
                    isPaddingNeed: false,
                    bannerImages: controller.image.value,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.productName.value,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(controller.categoryName.value,
                            style: AppTextStyle()
                                .br14w400
                                .copyWith(color: const Color(0xFF757575))),
                        Text('Available stock ${controller.totalStock.value}',
                            style: AppTextStyle()
                                .br14w400
                                .copyWith(color: const Color(0xFF757575))),
                      ],
                    ),
                    Row(
                      children: List.generate(
                          5,
                          (_) => const Icon(Icons.star,
                              size: 18, color: Colors.amber)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      controller.price.value,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    const SizedBox(width: 4),
                    Text("/ 1 ${controller.unit.value}",
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                controller.totalStock.value == 0
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          IconButton(
                            icon:
                                const Icon(Icons.remove, color: Colors.orange),
                            onPressed: () => controller.decreaseQuantity(),
                          ),
                          Text(
                            '${controller.quantity.value} ${controller.unit.value}',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.orange),
                            onPressed: () => controller.increaseQuantity(
                                stockQty: controller.totalStock.value),
                          ),
                        ],
                      ),
                const SizedBox(height: 16),
                Text("Description",
                    style: AppTextStyle()
                        .br14w600
                        .copyWith(color: const Color(0xFF5A5A5A))),
                const SizedBox(height: 6),
                Text(
                  controller.description.value,
                  style: AppTextStyle()
                      .br14w400
                      .copyWith(color: const Color(0xFF5A5A5A)),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: controller.totalStock.value == 0
                          ? () {
                              // Show Snackbar if stock is 0
                              fnShowSnackBarWarning("Out of Stock");
                            }
                          : () => controller.onAddToCartTap(
                                context,
                                productId: controller.id,
                                quantity: controller.quantity.value,
                              ),
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.orange),
                      label: Text("Add to Cart",
                          style: AppTextStyle()
                              .br16w400
                              .copyWith(color: const Color(0xFFEE9700))),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed:
                          // () {
                          //   devPrint(
                          //       ' int.tryPars  ${int.tryParse(controller.price.value ?? '0') ?? 0}');
                          //   devPrint(' int  ${controller.price.value ?? '0'}');
                          //   controller.onBuyNowTap(context,
                          //       price:
                          //           (double.tryParse(controller.price.value ?? '0')
                          //                   ?.toInt()) ??
                          //               0,
                          //       productId: controller.id,
                          //       quantity: controller.quantity.value);
                          // },
                          controller.totalStock.value == 0
                              ? () {
                                  fnShowSnackBarWarning("Out of Stock");
                                }
                              : () {
                                  devPrint(
                                      'int.tryParse ${int.tryParse(controller.price.value ?? '0') ?? 0}');
                                  devPrint(
                                      'int ${controller.price.value ?? '0'}');
                                  controller.onBuyNowTap(
                                    context,
                                    price: (double.tryParse(
                                                controller.price.value ?? '0')
                                            ?.toInt()) ??
                                        0,
                                    productId: controller.id,
                                    quantity: controller.quantity.value,
                                  );
                                },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEE9700),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text(
                        "Buy Now",
                        style: AppTextStyle()
                            .br16w400
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                controller.isNeed.value
                    ? Text("Related Products", style: AppTextStyle().br16w400)
                    : const SizedBox.shrink(),
                const SizedBox(height: 12),
                controller.isNeed.value
                    ? GridView.builder(
                        itemCount: controller.relatedProducts.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 24),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 3 / 3.5,
                        ),
                        itemBuilder: (context, index) {
                          final item = controller.relatedProducts[index];
                          // return
                          // GestureDetector(
                          //   onTap: () => null,
                          //   child: ProductCard(
                          //     isListingPage: true,
                          //     productName: item.productName,
                          //     currentPrice: item.currentPrice,
                          //     oldPrice: '',
                          //     quantityInfo: "/ ${item.quantityInfo}",
                          //     isFavorite: false,
                          //     enableActions: true,
                          //     onAddToCart: controller.onAddToCartFromCard,
                          //     onFavoriteToggle: controller.onFavoriteToggle,
                          //   ),
                          // );
                          return GestureDetector(
                            onTap: () => controller.onProductContainerTap(
                                index: index, id: item.id),
                            child: Container(
                              width: 120,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Product Image
                                  Stack(children: [
                                    Container(
                                      color: Colors.grey[350],
                                      height: 100,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          formatImageUrl(item.imageUrl?.first),
                                          height: 80,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  const Icon(
                                            Icons.image,
                                            size: 36,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 6,
                                      right: 6,
                                      child: Icon(
                                        item.isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: item.isFavorite
                                            ? Colors.red
                                            : Colors.grey,
                                        size: 18,
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(height: 8),
                                  // Product Name
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  // const SizedBox(height: 4),
                                  // Price Row
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '₹ ${item.price}',
                                        style: const TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' / ${item.quantity}',
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(
                                            Icons.shopping_cart_outlined,
                                            color: Colors.grey),
                                        onPressed: () {
                                          // handle add to cart
                                        },
                                        iconSize: 20,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ));
  }
}
