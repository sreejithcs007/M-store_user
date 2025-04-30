import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/payment_screen/ui.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/shared/repo/authorised/view_cart/view_cart_repo.dart';
import 'package:ecommerce/shared/repo/authorised/wishlist_list_repo/wishlist_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewController extends GetxController {
  RxList<CartItemCustomModel> cartItems = <CartItemCustomModel>[].obs;

  RxDouble subtotal = 0.0.obs;
  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  void onFavoriteToggle({required int index}) {
    cartItems.value[index].isFavorite = !cartItems.value[index].isFavorite;

    if (cartItems.value[index].isFavorite == true) {
      onFavouritePressedToAdd(productId: cartItems.value[index].productId);
    } else {
      onFavouritePressedToDelete(productId: cartItems.value[index].productId);
    }
    cartItems.refresh();
  }

  Future<void> onFavouritePressedToAdd({required int productId}) async {
    var response = await WishListRepo().onWishListPostAdd(productId: productId);
  }

  Future<void> onFavouritePressedToDelete({required int productId}) async {
    var response =
        await WishListRepo().onWishListPostDelete(productId: productId);
  }

  Future<void> _initial() async {
    var response = await ViewCartRepo().onViewCart();

    if ((response != null) && (response.isNotEmpty)) {
      cartItems.value = response
          .where((e) => e.product != null) // filter out null products
          .map(
            (e) => CartItemCustomModel(
                id: e.id!,
                isFavorite: e.product?.isFavorited ?? false,
                name: e.product!.name ?? '',
                price: e.product!.price ?? '',
                quantity: e.quantity ?? 1,
                unit: e.product!.quantityUnit ?? 'KG',
                imageUrl: e.product!.images,
                productId: e.product!.id!,
                stockQty: e.product?.stock),
          )
          .toList();
    } else {
      cartItems.value = [];
    }
    calculateSubTotal(cartItems);
  }

  Future<void> proceedToBuy() async {
    var response = await ProductDetailsRepo().onBuyNow(
      productId: 1,
      quantity: 1,
      price: 1,
      body: {
        "user_id": GetHiveHelper.getUserDetailsHive()?.id,
        "payment_method": "cod",
        "items": cartItems.map((element) {
          return {
            "product_id": element.productId,
            "quantity": element.quantity,
            "price": (double.tryParse(element.price ?? '0')?.toInt()),
          };
        }).toList(),
      },
    );

    if ((response != null) && (response.status == 201)) {
      Navigator.push(
          knNavGlobalKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const PurchaseSuccessScreen(),
          ));
      for (int i = 0; i < cartItems.length; i++) {
        var element = cartItems[i];
        deleteFromCart(cartId: element.id, index: i);
      }
    } else {
      Navigator.push(
          knNavGlobalKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const PurchaseSuccessScreen(),
          ));
    }
  }

  Future<void> deleteFromCart({required int index, required int cartId}) async {
    var response = await ViewCartRepo().onDeleteCartItem(cartId: cartId);

    if (response?.status == 200) {
      cartItems.removeAt(index);
      calculateSubTotal(cartItems);

      fnShowSnackBarSucess('Product removed successfully');
    }
  }

  Future<void> decreaseQuantity({
    required int index,
  }) async {
    if (cartItems[index].quantity! > 1) {
      cartItems[index].quantity = (cartItems[index].quantity ?? 1) - 1;
      cartItems.refresh();

      var res = await ViewCartRepo().onQuantutyUpdateCartItem(
          cartId: cartItems[index].id,
          quantity: cartItems[index].quantity ?? 1);

      if (res?.status == 200) {
        calculateSubTotal(cartItems);
        devPrintSuccess('updated');
      }
    } else {
      fnShowSnackBarWarning('Minimum 1 quantity required');
    }
  }

  Future<void> increaseQuantity(
      {required int index, required int stockQty}) async {
    if (cartItems[index].quantity! < (stockQty ?? 0)) {
      cartItems[index].quantity = (cartItems[index].quantity ?? 1) + 1;
      cartItems.refresh();
      var res = await ViewCartRepo().onQuantutyUpdateCartItem(
          cartId: cartItems[index].id,
          quantity: cartItems[index].quantity ?? 1);
      if (res?.status == 200) {
        calculateSubTotal(cartItems);
        devPrintSuccess('updated');
      }
    } else {
      fnShowSnackBarWarning('Maximum available stock reached');
    }
  }

  void onProductContainerTap({required int index, required int id}) {
    devPrintError('pushed');
    Navigator.push(
      knNavGlobalKey.currentContext!,
      MaterialPageRoute(
        builder: (_) => DetailsScreenView(
          id: id,
        ),
      ),
    );
  }

  void calculateSubTotal(List<CartItemCustomModel> cartItems) {
    double total = 0.0;

    for (var item in cartItems) {
      final double price = double.tryParse(item.price) ?? 0.0;
      devPrintSuccess('price== $price');
      final double qty = double.tryParse(item.quantity.toString()) ?? 0.0;
      devPrintSuccess(' qty== $qty');
      total += price * qty;
      devPrintSuccess(' tot== $total');
    }
    subtotal.value = total;
  }
}
