import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/dashboard/controller.dart';
import 'package:ecommerce/widget/cutom_appbar/view.dart';
import 'package:ecommerce/widget/cutsom_carousel/custom_carousel.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../widget/cutom_card/view.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key, required this.controller});
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              onCartTap: () => controller.onCartTap(context),
              onClearSearch: controller.onClearSearch,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Obx(
                () => SimpleCarousel(
                  bannerImages: controller.bannerList.value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: AppTextStyle().br16w600),
                  GestureDetector(
                    onTap: () => controller.onViewAllTap(context),
                    child: Text("View All",
                        style: AppTextStyle()
                            .br16w400
                            .copyWith(color: const Color(0xFFEE9700))),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: min(4, controller.categories.value.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 3 / 2.5,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryGridItem(
                      imageUrl: formatImageUrl(
                              controller.categories.value[index].imageUrl) ??
                          '',
                      isFavourite: false,
                      title:
                          controller.categories.value[index].categoryName ?? '',
                      onTap: () => controller.onCategoryContainerTap(
                          index: index,
                          id: controller.categories.value[index].id!),
                      // onContainerTap: () => controller.onCategoryContainerTap(index: index,id: controller.categories.value[index].id!),
                      // title: controller.categories.value[index].categoryName);
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Today's Offer", style: AppTextStyle().br16w600),
            ),
            const SizedBox(height: 12),
            Obx(
              () => controller.todaysOfferList.value.isEmpty
                  ? Center(child: Lottie.asset('assets/animation/Anime1.json'))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.todaysOfferList.value.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                            onTap: () => controller.todaysOfferOnTap(context,
                                id: controller.todaysOfferList.value[index].id),
                            child: ProductCard(
                              productName: "Carrot",
                              currentPrice: "55.00",
                              oldPrice: "65.00",
                              quantityInfo: "/ 1 KG",
                              isFavorite: false,
                              enableActions: true,
                              onAddToCart: controller.onAddToCart,
                              onFavoriteToggle: controller.onFavoriteToggle,
                              image: SvgPicture.asset(
                                  Assets.images.svg.shoppingBag,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

// import 'dart:math';

// import 'package:ecommerce/core/constants/text_style.dart';
// import 'package:ecommerce/core/functions/image_extract/image_link.dart';
// import 'package:ecommerce/gen/assets.gen.dart';
// import 'package:ecommerce/module/authorised/dashboard/controller.dart';
// import 'package:ecommerce/widget/cutom_appbar/view.dart';
// import 'package:ecommerce/widget/cutsom_carousel/custom_carousel.dart';
// import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
// import '../../../../widget/cutom_card/view.dart';

// class DashboardScreen extends StatelessWidget {
//   DashboardScreen({super.key, required this.controller});
//   final DashboardController controller;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         width: double.infinity,
//         color: const Color(0xFFF5F5F5),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomAppBar(
//               onCartTap: () => controller.onCartTap(context),
//               onClearSearch: controller.onClearSearch,
//             ),

//             // Banner Carousel with loading
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Obx(() {
//                 if (controller.isBannerLoading.value) {
//                   return const Center(child: CupertinoActivityIndicator());
//                 }
//                 return SimpleCarousel(
//                   bannerImages: controller.bannerList.value,
//                 );
//               }),
//             ),

//             // Categories Title and View All
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Categories", style: AppTextStyle().br16w600),
//                   GestureDetector(
//                     onTap: () => controller.onViewAllTap(context),
//                     child: Text("View All",
//                         style: AppTextStyle()
//                             .br16w400
//                             .copyWith(color: const Color(0xFFEE9700))),
//                   ),
//                 ],
//               ),
//             ),
//             const Gap(20),

//             // Category Grid with loading
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Obx(() {
//                 if (controller.isCategoriesLoading.value) {
//                   return const Center(child: CupertinoActivityIndicator());
//                 }
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: min(4, controller.categories.value.length),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                     childAspectRatio: 3 / 2.5,
//                   ),
//                   itemBuilder: (context, index) {
//                     final category = controller.categories.value[index];
//                     return CategoryGridItem(
//                       imageUrl: formatImageUrl(category.imageUrl) ?? '',
//                       isFavourite: false,
//                       title: category.categoryName ?? '',
//                       onTap: () => controller.onCategoryContainerTap(
//                           index: index, id: category.id!),
//                     );
//                   },
//                 );
//               }),
//             ),

//             const SizedBox(height: 24),

//             // Today's Offer Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Text("Today's Offer", style: AppTextStyle().br16w600),
//             ),
//             const SizedBox(height: 12),

//             // Offers List with loading
//             Obx(() {
//               if (controller.isTodaysOfferLoading.value) {
//                 return const Center(child: CupertinoActivityIndicator());
//               }

//               if (controller.todaysOfferList.value.isEmpty) {
//                 return Center(
//                     child: Lottie.asset('assets/animation/Anime1.json'));
//               }

//               return ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: controller.todaysOfferList.value.length,
//                 itemBuilder: (context, index) {
//                   final offer = controller.todaysOfferList.value[index];
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: GestureDetector(
//                       onTap: () => controller.todaysOfferOnTap(context, id: offer.id),
//                       child: ProductCard(
//                         productName: offer.itemName,
//                         currentPrice: offer.itemCost.toStringAsFixed(2),
//                         oldPrice: offer.previousCost.toStringAsFixed(2),
//                         quantityInfo: "/ ${offer.qty} KG",
//                         isFavorite: offer.wishList,
//                         enableActions: true,
//                         onAddToCart: controller.onAddToCart,
//                         onFavoriteToggle: controller.onFavoriteToggle,
//                         image: SvgPicture.asset(
//                           Assets.images.svg.shoppingBag,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }),

//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }

