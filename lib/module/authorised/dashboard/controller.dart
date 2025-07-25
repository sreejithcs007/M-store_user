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
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/view_all_category/screen.dart';
import 'package:ecommerce/module/authorised/view_cart/screen.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/shared/repo/authorised/wishlist_list_repo/wishlist_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxList<Widget> bannerList = <Widget>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxList<ProductCardModel> todaysOfferList = <ProductCardModel>[].obs;

  final RxBool isBannerLoading = false.obs;
  final RxBool isCategoriesLoading = false.obs;
  final RxBool isTodaysOfferLoading = false.obs;
  RxBool isAddToCart = false.obs;
  RxString imageUrl = ''.obs;
  RxString email = ''.obs;
  RxString name = ''.obs;
  RxInt superCoin = 0.obs;

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await ProfileRepo().onProfileFetch();
    if (response != null) {
      imageUrl.value = response.uProfilePic ?? '';
      name.value = response.uName ?? '';
      email.value = response.uEmail ?? '';
      superCoin.value = response.superCoins ?? 0;
    }
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
                wishList: e.product?.isFavorited ?? false,
                id: e.id!,
                unit: e.product?.quantityUnit ?? 'Kg',
                imageUrl: e.product?.images?.first ?? '',
                productId: e.product?.id,
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
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ViewAllScreen()));
  }

  void onClearSearch() {
    // print("Clear search");
  }

  Future<void> onAddToCart(
      {required int productId, required int quantity}) async {
    isAddToCart = true.obs;
    var response = await ProductDetailsRepo()
        .onAddToCart(productId: productId, quantity: quantity);

    // devPrintSuccess('api reponse == $response');

    if ((response != null) && (response.status == 201)) {
      fnShowSnackBarSucess('Product added to cart successfully');
    }
  }

  void onFavoriteToggle({required int index}) {
    todaysOfferList.value[index].wishList =
        !todaysOfferList.value[index].wishList;

    if (todaysOfferList.value[index].wishList == true) {
      onFavouritePressedToAdd(
          productId: todaysOfferList.value[index].productId!);
    } else {
      onFavouritePressedToDelete(
          productId: todaysOfferList.value[index].productId!);
    }
    todaysOfferList.refresh();
  }

  Future<void> onFavouritePressedToAdd({required int productId}) async {
    var response = await WishListRepo().onWishListPostAdd(productId: productId);
  }

  Future<void> onFavouritePressedToDelete({required int productId}) async {
    var response =
        await WishListRepo().onWishListPostDelete(productId: productId);
  }

  void onCategoryContainerTap({required int index, required int id}) {
    // Navigator.push(
    //   knNavGlobalKey.currentContext!,
    //   MaterialPageRoute(
    //     builder: (_) => ProductListScreen(index: index, id: id),
    //   ),
    // );
    Navigator.push(
        knNavGlobalKey.currentContext!,
        MaterialPageRoute(
          builder: (context) => NavScreen(
            index: 1,
            id: id,
            tabIndex: index,
          ),
        ));
  }

  void todaysOfferOnTap(BuildContext context, {required int id}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(
          id: id,
          isTodaysOffer: true,
        ),
      ),
    );
  }
}
