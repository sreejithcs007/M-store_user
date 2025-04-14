import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/dashboard/controller.dart';
import 'package:ecommerce/widget/cutom_appbar/view.dart';
import 'package:ecommerce/widget/cutsom_carousel/custom_carousel.dart';
import 'package:ecommerce/widget/grid_view_dashboard/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
              onCartTap: controller.onCartTap,
              onClearSearch: controller.onClearSearch,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SimpleCarousel(
                bannerImages: controller.bannerImages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Categories",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  GestureDetector(
                    onTap: () => controller.onViewAllTap(context),
                    child: const Text("View All",
                        style: TextStyle(color: Colors.orange)),
                  ),
                ],
              ),
            ),
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3 / 2.5,
                ),
                itemBuilder: (context, index) {
                  return CategoryGridItem(
                      onContainerTap: () => null,
                      title: controller.categories[index]["title"]!);
                },
              ),
            ),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Today's Offer",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 12),
            Obx(
              () =>  ListView.builder(
                shrinkWrap: true,
                itemCount: controller.todaysOfferList.value.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GestureDetector(
                      onTap: () => controller.todaysOfferOnTap(context),
                      child: ProductCard(
                        productName: "Carrot",
                        currentPrice: "55.00",
                        oldPrice: "65.00",
                        quantityInfo: "/ 1 KG",
                        isFavorite: false,
                        enableActions: true,
                        onAddToCart: controller.onAddToCart,
                        onFavoriteToggle: controller.onFavoriteToggle,
                        image: SvgPicture.asset(Assets.images.svg.shoppingBag,
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
