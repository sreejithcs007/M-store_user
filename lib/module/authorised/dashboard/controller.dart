import 'package:ecommerce/module/authorised/view_all/screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashboardController extends GetxController{
  void onCartTap() {
    print("Cart tapped");
  }

  void onClearSearch() {
    print("Clear search");
  }

  void onViewAllTap(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllScreen() ,));
  }

  void onAddToCart() {
    print("Add to cart");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }
}
