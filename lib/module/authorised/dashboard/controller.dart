// import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
// import 'package:ecommerce/core/dev_tools/dev_tools.dart';
// import 'package:ecommerce/core/functions/image_extract/image_link.dart';
// import 'package:ecommerce/module/authorised/details_page/screen.dart';
// import 'package:ecommerce/module/authorised/product_list_Screen.dart/screen.dart';
// import 'package:ecommerce/module/authorised/view_all_category/screen.dart';
// import 'package:ecommerce/module/authorised/view_cart/screen.dart';
// import 'package:ecommerce/shared/model/categories/model.dart';
// import 'package:ecommerce/shared/model/product_card/model.dart';
// import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class DashboardController extends GetxController {
//   final RxList<String> bannerImages = <String>[].obs;

//   RxList<Widget> bannerList = <Widget>[].obs;

//   RxList<ProductCardModel> todaysOfferList = <ProductCardModel>[].obs;

//   RxList<CategoryModel> categories = <CategoryModel>[].obs;

//   void todaysOfferOnTap(BuildContext context, {required int id}) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => DetailsScreenView(
//           id: id,
//         ),
//       ),
//     );
//   }

//   void onCategoryContainerTap({required int index, required int id}) {
//     Navigator.push(
//       knNavGlobalKey.currentContext!,
//       MaterialPageRoute(
//         builder: (_) => ProductListScreen(
//           index: index,
//           id: id,
//         ),
//       ),
//     );
//   }

//   void onCartTap(BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CartView(),
//         ));
//   }

//   void onClearSearch() {
//     print("Clear search");
//   }

//   void onViewAllTap(BuildContext context) {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ViewAllScreen(),
//         ));
//   }

//   void onAddToCart() {
//     print("Add to cart");
//   }

//   void onFavoriteToggle() {
//     print("Toggle fav");
//   }

//   @override
//   void onInit() {
//     _initial();
//     super.onInit();
//   }

//   Future<void> _initial() async {
//     var categoryResponse = await DashBoardRepo().onCategoryFetch();
//     if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
//       categories.value = categoryResponse
//           .map(
//             (e) => CategoryModel(
//                 categoryName: e.name ?? '', imageUrl: e.image ?? '', id: e.id),
//           )
//           .toList();
//     }

//     var bannerResponse = await DashBoardRepo().onBannerFetch();

//     devPrintWarning('banner == $bannerResponse');

//     if ((bannerResponse != null) && (bannerResponse.isNotEmpty)) {
//       bannerList.value = bannerResponse
//           .map(
//             (e) => Image.network(
//               formatImageUrl(e.image),
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) => const Icon(
//                 Icons.image,
//                 size: 36,
//                 color: Colors.grey,
//               ),
//             ),
//           )
//           .toList();

//       devPrintError('bannerList == ${bannerList.value}');
//       // .map(
//       //   (e) => CategoryModel(
//       //       categoryName: e.description ?? '', id: e.id, imageUrl: e.image),
//       // )
//       // .toList();
//     }

//     var todaysOfferResponse = await DashBoardRepo().onTodaysOfferFetch();

//     if ((todaysOfferResponse != null) && (todaysOfferResponse.isNotEmpty)) {
//       todaysOfferList.value = todaysOfferResponse
//           .where((e) => e.product != null)
//           .map(
//             (e) => ProductCardModel(
//               itemCost: double.tryParse(e.discountAmount ?? '0') ?? 0.0,
//               itemName: e.product?.name ?? '',
//               previousCost: double.tryParse(e.product?.price ?? '0') ?? 0.0,
//               qty: double.tryParse((e.product?.quantity == 0
//                           ? '1'
//                           : e.product?.quantity.toString()) ??
//                       '1') ??
//                   1,
//               wishList: false,
//               id: e.id!,
//             ),
//           )
//           .toList();
//     }

//     devPrintError('categories.value == ${categories.value.length}');
//   }
// }

import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/screen.dart';
import 'package:ecommerce/module/authorised/view_all_category/screen.dart';
import 'package:ecommerce/module/authorised/view_cart/screen.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxList<Widget> bannerList = <Widget>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<ProductCardModel> todaysOfferList = <ProductCardModel>[].obs;

  final RxBool isBannerLoading = false.obs;
  final RxBool isCategoriesLoading = false.obs;
  final RxBool isTodaysOfferLoading = false.obs;

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    await fetchCategories();
    await fetchBanners();
    await fetchTodaysOffers();
  }

  Future<void> fetchCategories() async {
    isCategoriesLoading.value = true;
    var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && categoryResponse.isNotEmpty) {
      categories.value = categoryResponse
          .map((e) => CategoryModel(
                categoryName: e.name ?? '',
                imageUrl: e.image ?? '',
                id: e.id,
              ))
          .toList();
    }
    isCategoriesLoading.value = false;
  }

  Future<void> fetchBanners() async {
    isBannerLoading.value = true;
    var bannerResponse = await DashBoardRepo().onBannerFetch();
    if ((bannerResponse != null) && bannerResponse.isNotEmpty) {
      bannerList.value = bannerResponse
          .map((e) => Image.network(
                formatImageUrl(e.image) ?? '',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image,
                  size: 36,
                  color: Colors.grey,
                ),
              ))
          .toList();
    }
    isBannerLoading.value = false;
  }

  Future<void> fetchTodaysOffers() async {
    isTodaysOfferLoading.value = true;
    var offerResponse = await DashBoardRepo().onTodaysOfferFetch();
    if ((offerResponse != null) && offerResponse.isNotEmpty) {
      todaysOfferList.value = offerResponse
          .where((e) => e.product != null)
          .map((e) => ProductCardModel(
                itemCost: double.tryParse(e.discountAmount ?? '0') ?? 0.0,
                itemName: e.product?.name ?? '',
                previousCost: double.tryParse(e.product?.price ?? '0') ?? 0.0,
                qty:
                    double.tryParse((e.product?.quantity?.toString() ?? '1')) ??
                        1,
                wishList: false,
                id: e.id!,
              ))
          .toList();
    }
    isTodaysOfferLoading.value = false;
  }

  void onCartTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CartView()));
  }

  void onViewAllTap(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const ViewAllScreen()));
  }

  void onClearSearch() {
    print("Clear search");
  }

  void onAddToCart() {
    print("Add to cart");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }

  void onCategoryContainerTap({required int index, required int id}) {
    Navigator.push(
      knNavGlobalKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => ProductListScreen(index: index, id: id),
      ),
    );
  }

  void todaysOfferOnTap(BuildContext context, {required int id}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(id: id),
      ),
    );
  }
}
