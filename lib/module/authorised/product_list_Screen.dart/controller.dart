import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/view_cart/screen.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/shared/repo/authorised/products_by_category/product_category_repo.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/shared/repo/authorised/wishlist_list_repo/wishlist_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreenController extends GetxController {
  RxBool isList = false.obs;
  RxBool isProductLoading = false.obs;
  int? index;
  int? id;
  RxString imageUrls = ''.obs;
  RxString email = ''.obs;
  RxString name = ''.obs;
  ProductListScreenController(this.index, this.id);
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  RxInt superCoin = 0.obs;

  final formkey = GlobalKey<FormState>();

  final minCostController = TextEditingController();
  final maxCostController = TextEditingController();

  RxString imageUrl = ''.obs;

  RxList<CartItemCustomModel> productsPerTab = <CartItemCustomModel>[].obs;

  void onCartTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CartView(),
        ));
  }

  void onTap({required int index, required int id}) async {
    index = index;
    id = id;
    isProductLoading.value = true;
    var responnse = await ProductCategoryRepo().onProductCategoryFetch(id: id);

    if ((responnse != null) && (responnse.isNotEmpty)) {
      productsPerTab.value = responnse
          .map(
            (e) => CartItemCustomModel(
                stockQty: e.stock,
                productId: e.id!,
                isFavorite: e.isFavorited ?? false,
                name: e.name ?? '',
                price: e.price ?? '',
                quantity: e.quantity ?? 0,
                unit: e.quantityUnit ?? 'KG',
                id: e.id!,
                imageUrl: e.images),
          )
          .toList();
    } else {
      productsPerTab.value = [];
    }
    isProductLoading.value = false;
  }

  Future<void> onAddToCart(
      {required int productId, required int quantity}) async {
    var response = await ProductDetailsRepo()
        .onAddToCart(productId: productId, quantity: quantity);

    devPrintSuccess('api reponse == $response');

    if ((response != null) && (response.status == 201)) {
      fnShowSnackBarSucess('Product added to cart successfully');
    }
  }
Future<void> onFilterApply({
  required int ids,
  required int min,
  required int max,
}) async {
  if (!formkey.currentState!.validate()) {
    fnShowSnackBarWarning('Please check your inputs');
    return;
  }

  // Input validation
  if (min > max) {
    fnShowSnackBarWarning('Min price cannot be greater than max price');
    return;
  }

  // Clear existing data
  productsPerTab.value = [];

  // Call API
  final response = await ProductCategoryRepo().onProductFilter(
    id: ids,
    min: min,
    max: max,
  );

  // Handle response
  if (response != null && response.isNotEmpty) {
    productsPerTab.value = response
        .map(
          (e) => CartItemCustomModel(
            stockQty: e.stock,
            productId: e.id!,
            isFavorite: e.isFavorited ?? false,
            name: e.name ?? '',
            price: e.price ?? '',
            quantity: e.quantity ?? 0,
            unit: e.quantityUnit ?? 'KG',
            id: e.id!,
            imageUrl: e.images,
          ),
        )
        .toList();

    fnShowSnackBarSucess('Successfully filtered');
  } else {
    fnShowSnackBarWarning('No products found in this price range');
  }
}


  void onFavoriteToggle({required int index}) {
    productsPerTab.value[index].isFavorite =
        !productsPerTab.value[index].isFavorite;
    // print('here');
    if (productsPerTab.value[index].isFavorite == true) {
      onFavouritePressedToAdd(productId: productsPerTab.value[index].productId);
    } else {
      onFavouritePressedToDelete(
          productId: productsPerTab.value[index].productId);
    }
    productsPerTab.refresh();
  }

  Future<void> onFavouritePressedToAdd({required int productId}) async {
    var response = await WishListRepo().onWishListPostAdd(productId: productId);
  }

  Future<void> onFavouritePressedToDelete({required int productId}) async {
    var response =
        await WishListRepo().onWishListPostDelete(productId: productId);
  }

  void onProductContainerTap({required int index, required int id}) {
    // devPrintError('pushed');
    Navigator.push(
      knNavGlobalKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(
          id: id,
        ),
      ),
    );
  }

  @override
  void onInit() {
    _initial();
    // TODO: implement onInit
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

    var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
      categories.value = categoryResponse
          .map(
            (e) => CategoryModel(
              categoryName: e.name ?? '',
              imageUrl: e.image ?? '',
              id: e.id,
            ),
          )
          .toList();
    }
    if (index == null) {
      onTap(index: 0, id: categories.value[0].id!);
    } else {
      onTap(index: index!, id: id!);
    }
  }
}
