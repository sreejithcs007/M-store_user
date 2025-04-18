import 'package:ecommerce/module/authorised/details_page/controller.dart';
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
          title: const Text("Product Detail",
              style: TextStyle(color: Colors.black)),
          leading: const BackButton(color: Colors.black),
          actions: [
            Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined,
                      color: Colors.orange),
                  onPressed: () {},
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        color: Colors.red, shape: BoxShape.circle),
                    child: const Text('1',
                        style: TextStyle(color: Colors.white, fontSize: 10)),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(
            () =>  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${controller.productName}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text("Vegetables",
                            style: TextStyle(color: Colors.grey)),
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
                      "₹${controller.price.value}",
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    const SizedBox(width: 4),
                    Text("/1 KG", style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Colors.orange),
                      onPressed: () => controller.decreaseQuantity(),
                    ),
                    Text(
                      '${controller.quantity.value} KG',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.orange),
                      onPressed: () => controller.increaseQuantity(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text("Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(height: 1.4),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () => controller.onAddToCartTap(context),
                      icon: const Icon(Icons.shopping_cart_outlined,
                          color: Colors.orange),
                      label: const Text("Add to Cart",
                          style: TextStyle(color: Colors.orange)),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: controller.onBuyNowTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: const Text("Buy Now"),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text("Related Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                const SizedBox(height: 12),
                // GridView.builder(
                //   itemCount: relatedProducts.length,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   padding: const EdgeInsets.only(bottom: 24),
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 16,
                //     mainAxisSpacing: 16,
                //     childAspectRatio: 3 / 3.5,
                //   ),
                //   itemBuilder: (context, index) {
                //     final item = relatedProducts[index];
                //     return GestureDetector(
                //       onTap: () => controller.onProductTap(
                //         context,
                //         item["title"]!,
                //         item["price"]!,
                //         item["quantity"]!,
                //       ),
                //       child: ProductCard(
                //         isListingPage: true,
                //         productName: item["title"]!,
                //         currentPrice: item["price"]!,
                //         oldPrice: '',
                //         quantityInfo: "/ ${item["quantity"]!}",
                //         isFavorite: false,
                //         enableActions: true,
                //         onAddToCart: controller.onAddToCartFromCard,
                //         onFavoriteToggle: controller.onFavoriteToggle,
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
