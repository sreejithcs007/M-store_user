import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/cart_items/view.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:ecommerce/shared/model/authorised/product_detail_model/prdt_details_model.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/widget/cutom_card/view.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  int id;
  bool isRelatedProductNeed;
  ProductDetailController(
      {required this.id, required this.isRelatedProductNeed});
  RxInt quantity = 0.obs;
  RxBool isAddToCart = false.obs;

  final RxString productName = ''.obs;
  final RxString categoryName = ''.obs;
  final RxString price = ''.obs;
  final RxString description = ''.obs;
  final RxString unit = ''.obs;
  final RxString image = ''.obs;
  final RxDouble totalStock = 0.0.obs;
  final RxBool isNeed = true.obs;

  RxList<ProductCard> relatedProducts = <ProductCard>[].obs;

  void increaseQuantity() {
    quantity = quantity + 1;
  }

  void decreaseQuantity() {
    quantity = quantity - 1;
  }

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

  void onBuyNowTap() {
    print("Buying Now");
  }

  void onProductTap(
      BuildContext context, String name, String price, String quantity) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => ProductDetailScreen(),
    //   ),
    // );
  }

  void onAddToCartFromCard() {
    print("Add to cart from card");
  }

  void onFavoriteToggle() {
    print("Toggle fav");
  }

  Future<void> _initial() async {
    var response = await ProductDetailsRepo().onProductDetailsFetch(id: id);

    if ((response != null) && (response.status == 200)) {
      var data = ProductDetailsModel.fromJson(response.data);
      productName.value = data.product?.name ?? '';
      price.value = data.product?.price ?? '0';
      quantity.value = data.product?.quantity ?? 1;
      categoryName.value = data.product?.category?.name ?? '';
      unit.value = 'KG'; //data.product?.
      image.value = data.product?.images?.first ?? '';
      totalStock.value =
          double.tryParse(data.product?.stock.toString() ?? '0') ?? 1;
    }
  }

  @override
  void onInit() {
    isNeed.value = isRelatedProductNeed;
    _initial();
    super.onInit();
  }
}
