import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/repo/authorised/view_cart/view_cart_repo.dart';
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

  Future<void> _initial() async {
    var response = await ViewCartRepo().onViewCart();

    if ((response != null) && (response.isNotEmpty)) {
      cartItems.value = response
          .map(
            (e) => CartItemCustomModel(
              id: e.id!,
              isFavorite: false,
              name: e.product?.name ?? '',
              price: e.product?.price ?? '',
              quantity: e.quantity ?? 1,
              unit: e.product?.quantityUnit ?? 'KG',
              imageUrl: e.product?.images ?? [],
              productId: e.product!.id!,
            ),
          )
          .toList();
    } else {
      cartItems.value = [];
    }
    calculateSubTotal(cartItems);
  }

  Future<void> deleteFromCart({required int index, required int cartId}) async {
    var response = await ViewCartRepo().onDeleteCartItem(cartId: cartId);

    if (response?.status == 200) {
      cartItems.removeAt(index);
      calculateSubTotal(cartItems);

      fnShowSnackBarSucess('Product removed successfully');
    }
  }

  Future<void> decreaseQuantity({required int index}) async {
    cartItems[index].quantity = (cartItems[index].quantity ?? 1) - 1;
    cartItems.refresh();

    var res = await ViewCartRepo().onQuantutyUpdateCartItem(
        cartId: cartItems[index].id, quantity: cartItems[index].quantity ?? 1);

    if (res?.status == 200) {
      calculateSubTotal(cartItems);
      devPrintSuccess('updated');
    }
  }

  Future<void> increaseQuantity({required int index}) async {
    cartItems[index].quantity = (cartItems[index].quantity ?? 1) + 1;
    cartItems.refresh();

    var res = await ViewCartRepo().onQuantutyUpdateCartItem(
        cartId: cartItems[index].id, quantity: cartItems[index].quantity ?? 1);

    if (res?.status == 200) {
      calculateSubTotal(cartItems);
      devPrintSuccess('updated');
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
