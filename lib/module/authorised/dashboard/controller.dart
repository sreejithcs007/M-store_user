import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/gen/assets.gen.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/view_all_category/screen.dart';
import 'package:ecommerce/shared/model/authorised/category_list/category_list.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:carousel_slider/carousel_slider.dart';

class DashboardController extends GetxController {
  // final List<Map<String, String>> categories = [];

    final List<Widget> bannerImages = [
    SvgPicture.asset(Assets.images.svg.shoppingBag, fit: BoxFit.fill),
    SvgPicture.asset(Assets.images.svg.user, fit: BoxFit.fill),
    SvgPicture.asset(Assets.images.svg.shoppingBag, fit: BoxFit.fill),
  ];

  // final List<Widget> bannerImages = [
  //   Container(color: Colors.red),
  //   Container(color: Colors.green),
  //   Container(color: Colors.blue),
  // ];

  RxList<Widget> bannerList = <Widget>[].obs;

  RxList<ProductCardModel> todaysOfferList = <ProductCardModel>[
    ProductCardModel(
        itemCost: 28,
        itemName: 'Carrot',
        previousCost: 30,
        qty: 1,
        wishList: false,
        id: 1
        ),
    ProductCardModel(
        itemCost: 40,
        itemName: 'Onion',
        previousCost: 45,
        qty: 1,
        wishList: false,
        id: 2
        ),
  ].obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  void todaysOfferOnTap(BuildContext context,{required int id}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(id: id,),
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

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
      categories.value = categoryResponse
          .map(
            (e) => CategoryModel(
                categoryName: e.name ?? '', imageUrl: e.image ?? '', id: e.id),
          )
          .toList();
    }

    var bannerResponse = await DashBoardRepo().onBannerFetch();

    // if ((bannerResponse != null) && (bannerResponse.isNotEmpty)) {
    //   bannerList.value = bannerResponse
    //       .map(
    //         (e) => ,
    //       )
    //       .toList();
    //       // .map(
    //       //   (e) => CategoryModel(
    //       //       categoryName: e.description ?? '', id: e.id, imageUrl: e.image),
    //       // )
    //       // .toList();
    // }

    devPrintError('categories.value == ${categories.value.length}');
  }
}
