import 'dart:math';
import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/dashboard/controller.dart';
import 'package:ecommerce/widget/custom_drawer/custom_drawer.dart';
import 'package:ecommerce/widget/cutom_appbar/view.dart';
import 'package:ecommerce/widget/cutsom_carousel/custom_carousel.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../widget/cutom_card/view.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.controller});
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Obx(
        () =>  MyCustomDrawer(
          email: controller.email.value,
          imageUrl: controller.imageUrl.value,
          name: controller.name.value,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: const Color(0xFFF5F5F5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                controller: controller,
                hintText: 'search category',
                imageUrl: controller.imageUrl,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                            controller.categories.value[index].categoryName ??
                                '',
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
                    ? Center(
                        child: Lottie.asset('assets/animation/emptyAnime.json'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.todaysOfferList.value.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: GestureDetector(
                              onTap: () => controller.todaysOfferOnTap(context,
                                  id: controller
                                      .todaysOfferList.value[index].productId!),
                              child: ProductCard(
                                productName: controller
                                    .todaysOfferList.value[index].itemName,
                                currentPrice: controller
                                    .todaysOfferList.value[index].itemCost
                                    .toStringAsFixed(2),
                                oldPrice: controller
                                    .todaysOfferList.value[index].previousCost
                                    .toStringAsFixed(2),
                                quantityInfo:
                                    "/ 1 ${controller.todaysOfferList.value[index].unit}",
                                isFavorite: controller
                                    .todaysOfferList.value[index].wishList,
                                onAddToCart: () => controller.onAddToCart(
                                    productId: controller.todaysOfferList
                                        .value[index].productId!,
                                    quantity: int.tryParse(controller
                                                .todaysOfferList
                                                .value[index]
                                                .qty
                                                .toString() ??
                                            '0') ??
                                        1),
                                onFavoriteToggle: () =>
                                    controller.onFavoriteToggle(index: index),
                                image: Image.network(
                                  formatImageUrl(controller
                                      .todaysOfferList.value[index].imageUrl),
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.image,
                                    size: 36,
                                    color: Colors.grey,
                                  ),
                                ),
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
      ),
    );
  }
}
