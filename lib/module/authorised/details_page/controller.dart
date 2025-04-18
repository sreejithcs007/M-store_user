import 'package:ecommerce/module/authorised/cart_items/view.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:flutter/material.dart';

class ProductDetailController {
  final ValueNotifier<int> quantityNotifier = ValueNotifier<int>(1);

  void increaseQuantity() {
    quantityNotifier.value++;
  }

  void decreaseQuantity() {
    if (quantityNotifier.value > 1) {
      quantityNotifier.value--;
    }
  }

  void onAddToCartTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
  }

  void onBuyNowTap() {
    print("Buying Now");
  }

  void onProductTap(
      BuildContext context, String name, String price, String quantity) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailScreen(
          productName: name,
          price: price,
          quantity: quantity,
        ),
      ),
    );
  }

  void onAddToCartFromCard() {
    print("Add to cart from card");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }
}
