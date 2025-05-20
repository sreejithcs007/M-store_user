// import 'package:ecommerce/core/constants/text_style.dart';
// import 'package:ecommerce/core/functions/image_extract/image_link.dart';
// import 'package:ecommerce/module/authorised/view_cart/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/gen/assets.gen.dart';

// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class CartViewMobile extends StatelessWidget {
//   const CartViewMobile({
//     super.key,
//     required this.controller,
//   });
//   final CartViewController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5F5),
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: SvgPicture.asset(Assets.images.svg.arrowLeft)),
//         title: Text('Items in your cart'),
//       ),
//       body: Obx(
//         () => controller.cartItems.value.isEmpty
//             ? Center(child: Lottie.asset('assets/animation/Anime1.json'))
//             : ListView.builder(
//                 itemCount: controller.cartItems.value.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding:
//                         const EdgeInsets.only(left: 15.0, right: 15, top: 15),
//                     child: InkWell(
//                       onTap: () => controller.onProductContainerTap(
//                           id: controller.cartItems[index].productId,
//                           index: index),
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(vertical: 6),
//                         padding: const EdgeInsets.all(12),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16),
//                           boxShadow: const [
//                             BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 6,
//                               offset: Offset(0, 2),
//                             ),
//                           ],
//                         ),
//                         child: _buildRowLayout(index: index),
//                       ),
//                     ),
//                   );
//                 }),
//       ),
//       bottomNavigationBar: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Obx(
//             () => Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Subtotal (${controller.cartItems.length} items):",
//                       style: AppTextStyle().br16w600),
//                   Text("${controller.subtotal.value.toStringAsFixed(2)}",
//                       style: AppTextStyle().br24w600),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton.icon(
//                 iconAlignment: IconAlignment.end,
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.orange,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//                 icon: const Icon(
//                   Icons.shopping_bag,
//                   color: Colors.white,
//                 ),
//                 label: Text(
//                   "Proceed to Buy",
//                   style: AppTextStyle().br16w400.copyWith(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRowLayout({required int index}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start, // Prevent overflow
//       children: [
//         // Image on the left
//         Container(
//           width: 100,
//           height: 110,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10), // match Container's radius
//             child: (controller.cartItems[index].imageUrl ?? []).isNotEmpty &&
//                     controller.cartItems[index].imageUrl!.first.isNotEmpty
//                 ? Image.network(
//                     formatImageUrl(controller.cartItems[index].imageUrl!.first),
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => const Icon(
//                       Icons.image,
//                       size: 36,
//                       color: Colors.grey,
//                     ),
//                   )
//                 : Image.asset(
//                     'assets/images/defaultimage.png',
//                     fit: BoxFit.cover,
//                   ),
//           ),
//         ),

//         const SizedBox(width: 16),

//         // Details next to image
//         Expanded(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [_buildDetails(index: index)],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDetails({required int index}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Product name + favorite
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 controller.cartItems[index].name,
//                 style: AppTextStyle().br16w600,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             Obx(
//               () =>  GestureDetector(
//                 onTap: () {
//                   controller.onFavoriteToggle(index: index);
//                 },
//                 child: SvgPicture.asset(
//                     controller.cartItems.value[index].isFavorite
//                         ? Assets.images.svg.redheart
//                         : Assets.images.svg.greyheart),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 6),

//         // Price and quantity info
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(controller.cartItems[index].price,
//                 style:
//                     AppTextStyle().br16w600.copyWith(color: Color(0xFFEE9700))),

//             // if (oldPrice.isNotEmpty)
//             Text(
//               " / 1 ${controller.cartItems[index].unit}",
//               style: AppTextStyle().br16w600.copyWith(color: Color(0xFFB3B3B3)),
//             ),
//           ],
//         ),
//         const SizedBox(height: 8),

//         // Add to cart
//         Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 controller.deleteFromCart(
//                     index: index, cartId: controller.cartItems[index].id);
//               },
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFEE9700).withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Remove",
//                         style: AppTextStyle()
//                             .br16w400
//                             .copyWith(color: Color(0xFFEE9700))),
//                     Gap(10),
//                     SvgPicture.asset(Assets.images.svg.delete),
//                   ],
//                 ),
//               ),
//             ),
//             Gap(20),
//             IconButton(
//               // icon: const Icon(Icons.remove, color: Color(0xFFEE9700)),
//               icon: SvgPicture.asset(
//                 Assets.images.svg.minusSquare,
//                 color: Color(0xFFEE9700),
//               ),
//               onPressed: () => controller.decreaseQuantity(index: index),
//             ),
//             // Gap(5),
//             Obx(
//               () => Text(
//                 '${controller.cartItems[index].quantity}',
//                 style:
//                     AppTextStyle().br16w600.copyWith(color: Color(0xFF757575)),
//               ),
//             ),
//             // Gap(5),
//             IconButton(
//               icon: SvgPicture.asset(
//                 Assets.images.svg.add,
//                 color: Color(0xFFEE9700),
//               ),
//               onPressed: () => controller.increaseQuantity(index: index),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/view_cart/controller.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CartViewMobile extends StatelessWidget {
  const CartViewMobile({
    super.key,
    required this.controller,
  });

  final CartViewController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(Assets.images.svg.arrowLeft),
        ),
        title: const Text('Items in your cart'),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.cartItems.value.isEmpty
              ? Center(child: Lottie.asset('assets/animation/emptyAnime.json'))
              : ListView.builder(
                  itemCount: controller.cartItems.value.length,
                  padding: const EdgeInsets.only(bottom: 100),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 8),
                      child: InkWell(
                        onTap: () => controller.onProductContainerTap(
                          id: controller.cartItems[index].productId,
                          index: index,
                        ),
                        child: Container(
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
                          child: _buildRowLayout(index),
                        ),
                      ),
                    );
                  },
                ),
        ),
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
                  Text(controller.subtotal.value.toStringAsFixed(2),
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
              child: Obx(
                () =>  ElevatedButton.icon(
                  iconAlignment: IconAlignment.end,
                  onPressed: controller.cartItems.any(
                    (element) => element.stockQty == 0,
                  )
                      ? () {
                          fnShowSnackBarWarning(
                              'Some of the product is out of stock');
                        }
                      : () {
                          controller.proceedToBuy();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.shopping_bag, color: Colors.white),
                  label: Text(
                    "Proceed to Buy",
                    style: AppTextStyle().br16w400.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRowLayout(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 110,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
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
        Expanded(child: _buildDetails(index)),
      ],
    );
  }

  Widget _buildDetails(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                controller.cartItems[index].name,
                style: AppTextStyle().br16w600,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Obx(() => GestureDetector(
                  onTap: () => controller.onFavoriteToggle(index: index),
                  child: SvgPicture.asset(
                    controller.cartItems[index].isFavorite
                        ? Assets.images.svg.redheart
                        : Assets.images.svg.greyheart,
                  ),
                )),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Text(
              controller.cartItems[index].price,
              style: AppTextStyle()
                  .br16w600
                  .copyWith(color: const Color(0xFFEE9700)),
            ),
            Flexible(
              child: Text(
                " / 1 ${controller.cartItems[index].unit}",
                style: AppTextStyle()
                    .br16w600
                    .copyWith(color: const Color(0xFFB3B3B3)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            controller.cartItems[index].stockQty == 0
                ? Text(
                    '(out of stock)',
                    style: AppTextStyle()
                        .br16w600
                        .copyWith(color: const Color(0xFFB3B3B3)),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Remove button on the left
            Flexible(
              child: GestureDetector(
                onTap: () => controller.deleteFromCart(
                  index: index,
                  cartId: controller.cartItems[index].id,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEE9700).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          "Remove",
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle()
                              .br16w400
                              .copyWith(color: const Color(0xFFEE9700)),
                        ),
                      ),
                      const Gap(6),
                      SvgPicture.asset(Assets.images.svg.delete),
                    ],
                  ),
                ),
              ),
            ),

            // Spacer
            const Gap(12),

            // Quantity control to the right end
            controller.cartItems[index].stockQty == 0
                ? const SizedBox.shrink()
                : Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.images.svg.minusSquare,
                          color: const Color(0xFFEE9700),
                        ),
                        onPressed: () =>
                            controller.decreaseQuantity(index: index),
                      ),
                      Obx(() => Text(
                            '${controller.cartItems[index].quantity}',
                            style: AppTextStyle()
                                .br16w600
                                .copyWith(color: const Color(0xFF757575)),
                          )),
                      IconButton(
                        icon: SvgPicture.asset(
                          Assets.images.svg.add,
                          color: const Color(0xFFEE9700),
                        ),
                        onPressed: () => controller.increaseQuantity(
                            index: index,
                            stockQty: int.tryParse(controller
                                    .cartItems[index].stockQty
                                    .toString()) ??
                                1),
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }
}
