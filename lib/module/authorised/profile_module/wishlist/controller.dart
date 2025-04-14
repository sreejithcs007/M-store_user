import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/widget/custom_details_page/custom_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {

  RxList<ProductCardModel> wishListItems = <ProductCardModel>[
    ProductCardModel(
        itemCost: 29,
        itemName: 'Tomato',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 10,
        itemName: 'garlic',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'lady finger',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 30,
        itemName: 'cucumber',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'onion',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 109,
        itemName: 'carrot',
        previousCost: 0,
        qty: 1,
        wishList: true),
  ].obs;
  RxList<ProductCardModel> viewdWishListItems = <ProductCardModel>[
    ProductCardModel(
        itemCost: 29,
        itemName: 'Tomato',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 10,
        itemName: 'garlic',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'lady finger',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 30,
        itemName: 'cucumber',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'onion',
        previousCost: 0,
        qty: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 109,
        itemName: 'carrot',
        previousCost: 0,
        qty: 1,
        wishList: true),
  ].obs;

    void onToDetailsPage(BuildContext context) {
      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomDetailsPage()),
            );
  }
}
