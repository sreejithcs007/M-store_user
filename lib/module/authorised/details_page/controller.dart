import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/cart_items/view.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  int id;
  ProductDetailController({required this.id});
  RxInt quantity = 0.obs;

  final RxString productName = ''.obs;
  final RxString price = ''.obs;
  final RxString description = ''.obs;

  void increaseQuantity() {
    quantity = quantity + 1;
  }

  void decreaseQuantity() {
    quantity = quantity - 1;
  }

  void onAddToCartTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
  }

  void onBuyNowTap() {
    print("Buying Now");
  }

  void onProductTap(
      BuildContext context, String name, String price, String quantity) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => ProductDetailScreen(),
    //   ),
    // );
  }

  void onAddToCartFromCard() {
    print("Add to cart from card");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }

  @override
  void onInit() {
    devPrintSuccess('od == $id');
    super.onInit();
  }
}
