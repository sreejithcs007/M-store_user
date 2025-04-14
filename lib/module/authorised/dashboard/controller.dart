import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:ecommerce/module/authorised/view_all/screen.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:carousel_slider/carousel_slider.dart';

class DashboardController extends GetxController {
  final List<Map<String, String>> categories = [
    {"title": "Vegetables"},
    {"title": "Groceries"},
    {"title": "Fruits"},
    {"title": "Stationery"},
  ];

  //   final List<Widget> bannerImages = [
  //   SvgPicture.asset(Assets.images.svg.shoppingBag, fit: BoxFit.fill),
  //   SvgPicture.asset(Assets.images.svg.user, fit: BoxFit.fill),
  //   SvgPicture.asset(Assets.images.svg.shoppingBag, fit: BoxFit.fill),
  // ];

  final List<Widget> bannerImages = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  RxList<ProductCardModel> todaysOfferList = <ProductCardModel>[
    ProductCardModel(
        itemCost: 28,
        itemName: 'Carrot',
        previousCost: 30,
        qty: 1,
        wishList: false),
    ProductCardModel(
        itemCost: 40,
        itemName: 'Onion',
        previousCost: 45,
        qty: 1,
        wishList: false),
  ].obs;

  void todaysOfferOnTap(BuildContext context) {
     Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(
                    productName: 'carrot',
                    price: '28',
                    quantity: '1',
                  ),
                ),
              );
  }

  int _currentIndex = 0;

  void onCartTap() {
    print("Cart tapped");
  }

  void onClearSearch() {
    print("Clear search");
  }

  void onViewAllTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ViewAllScreen(),
        ));
  }

  void onAddToCart() {
    print("Add to cart");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }
}
