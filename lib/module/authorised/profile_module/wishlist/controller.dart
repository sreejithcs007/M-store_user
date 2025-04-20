import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/shared/model/authorised/cart_model/view_cart_model.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/shared/repo/authorised/wishlist_list_repo/wishlist_repo.dart';
import 'package:ecommerce/widget/custom_details_page/custom_details_page.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController {
  RxList<CartItemCustomModel> wishListItems = <CartItemCustomModel>[].obs;
  RxList<ProductCardModel> viewdWishListItems = <ProductCardModel>[
    ProductCardModel(
        itemCost: 29,
        itemName: 'Tomato',
        previousCost: 0,
        qty: 1,
        id: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 10,
        itemName: 'garlic',
        previousCost: 0,
        qty: 1,
        id: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'lady finger',
        previousCost: 0,
        qty: 1,
        id: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 30,
        itemName: 'cucumber',
        previousCost: 0,
        qty: 1,
        id: 1,
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'onion',
        previousCost: 0,
        qty: 1,
        id: 1,
        wishList: true),
    ProductCardModel(
      itemCost: 109,
      itemName: 'carrot',
      previousCost: 0,
      qty: 1,
      id: 1,
      wishList: true,
    ),
  ].obs;

    RxBool isAddToCart = false.obs;

  Future<void> onAddToCartTap(BuildContext context,
      {required int productId, required int quantity}) async {
    isAddToCart = true.obs;
    var response = await ProductDetailsRepo()
        .onAddToCart(productId: productId, quantity: quantity);

    devPrintSuccess('api reponse == $response');

    if ((response != null) && (response.status == 201)) {
      fnShowSnackBarSucess('Product added to cart successfully');
    }
  }

  void onToDetailsPage(BuildContext context,{required int id}) {
       Navigator.push(
      knNavGlobalKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(
          id: id,
          isRelatedProductNeed: false,
        ),
      ),
    );
  }



  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await WishListRepo().onWishListFetch();

    if (response != null) {
      wishListItems.value = response.favorites
              ?.map(
                (e) => CartItemCustomModel(
                    id: e.id!,
                    price: e.product?.price ?? '0.0',
                    name: e.product?.name ?? '',
                    quantity:
                        int.tryParse(e.product?.quantity.toString() ?? '0') ??
                            0,
                    isFavorite: true,
                    unit: e.product?.quantityUnit ?? 'KG',
                    imageUrl: e.product?.images,
                    productId: e.product!.id!),
              )
              .toList() ??
          [];
    }
  }
}
