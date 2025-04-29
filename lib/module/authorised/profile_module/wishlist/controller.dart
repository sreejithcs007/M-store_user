import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/product_card/model.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/shared/repo/authorised/wishlist_list_repo/wishlist_repo.dart';
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
        imageUrl: '',
        wishList: true),
    ProductCardModel(
        itemCost: 10,
        itemName: 'garlic',
        previousCost: 0,
        qty: 1,
        id: 1,
        imageUrl: '',
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'lady finger',
        previousCost: 0,
        qty: 1,
        id: 1,
        imageUrl: "",
        wishList: true),
    ProductCardModel(
        itemCost: 30,
        itemName: 'cucumber',
        previousCost: 0,
        qty: 1,
        id: 1,
        imageUrl: '',
        wishList: true),
    ProductCardModel(
        itemCost: 129,
        itemName: 'onion',
        previousCost: 0,
        qty: 1,
        id: 1,
        imageUrl: '',
        wishList: true),
    ProductCardModel(
      itemCost: 109,
      itemName: 'carrot',
      previousCost: 0,
      qty: 1,
      id: 1,
      imageUrl: '',
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

  void onToDetailsPage(BuildContext context, {required int id}) {
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

  void onFavoriteToggle({required int index}) {
    wishListItems.value[index].isFavorite =
        !wishListItems.value[index].isFavorite;

    if (wishListItems.value[index].isFavorite == true) {
      onFavouritePressedToAdd(productId: wishListItems.value[index].productId);
    } else {
      onFavouritePressedToDelete(
          productId: wishListItems.value[index].productId, index: index);
    }
    wishListItems.refresh();
  }

  Future<void> onFavouritePressedToAdd({required int productId}) async {
    var response = await WishListRepo().onWishListPostAdd(productId: productId);
  }

  Future<void> onFavouritePressedToDelete(
      {required int productId, required int index}) async {
    wishListItems.value.removeAt(index);
    wishListItems.refresh();
    var response =
        await WishListRepo().onWishListPostDelete(productId: productId);
  }

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await WishListRepo().onWishListFetch();

    if (response != null) {
      devPrintSuccess('ws = $response');
      wishListItems.value = response
              .map(
                (e) => CartItemCustomModel(
                  stockQty: e.stock,
                  id: e.id!,
                  price: e.price ?? '0.0',
                  name: e.name ?? '',
                  quantity: int.tryParse(e.quantity.toString() ?? '0') ?? 0,
                  isFavorite: e.isFavorited ?? false,
                  unit: e.quantityUnit ?? 'KG',
                  imageUrl: e.images,
                  productId: e.id!,
                  
                ),
              )
              .toList() ??
          [];
    }
  }
}
