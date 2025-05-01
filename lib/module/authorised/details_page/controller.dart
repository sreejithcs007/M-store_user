import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/core/functions/image_extract/image_link.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/payment_screen/ui.dart';
import 'package:ecommerce/shared/model/authorised/product_detail_model/prdt_details_model.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/repo/authorised/product_details_repo.dart/details_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  int id;
  bool isRelatedProductNeed;
  bool isTodaysOffer;
  ProductDetailController(
      {required this.id, required this.isRelatedProductNeed,required this.isTodaysOffer});
  RxInt quantity = 0.obs;
  RxBool isAddToCart = false.obs;

  final RxString productName = ''.obs;
  final RxString categoryName = ''.obs;
  final RxString price = ''.obs;
  final RxString description = ''.obs;
  final RxString unit = ''.obs;
  final RxList<Widget> image = <Widget>[].obs;
  final RxDouble totalStock = 0.0.obs;
  final RxBool isNeed = true.obs;

  RxList<CartItemCustomModel> relatedProducts = <CartItemCustomModel>[].obs;

  void increaseQuantity({required double stockQty}) {
    if (quantity < (int.tryParse(stockQty.toString() ?? '0') ?? 0)) {
      quantity = quantity + 1;
    } else {
      fnShowSnackBarWarning('Maximum reached!');
    }
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity = quantity - 1;
    } else {
      fnShowSnackBarWarning('Quantity must be atleast 1');
    }
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

  Future<void> onBuyNowTap(BuildContext context,
      {required int productId,
      required int quantity,
      required int price}) async {
    devPrintError('price == $price');

    var response = await ProductDetailsRepo().onBuyNow(
        productId: productId,
        quantity: quantity,
        price: price,
        body: {
          "user_id": GetHiveHelper.getUserDetailsHive()?.id,
          "payment_method": "cod",
          "items": [
            {"product_id": productId, "quantity": quantity, "price": price}
          ]
        });
    if ((response != null) && (response.status == 201)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PurchaseSuccessScreen(),
          ));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PurchaseSuccessScreen(),
          ));
    }
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

  Future<void> _initial() async {
    var response = await ProductDetailsRepo().onProductDetailsFetch(id: id);

    if ((response != null) && (response.status == 200)) {
      var data = ProductDetailsModel.fromJson(response.data);
      productName.value = data.product?.name ?? '';
      description.value = data.product?.description ?? '';
      price.value = isTodaysOffer == true ? (data.product?.discount ?? '0') :  data.product?.price ?? '0';
      quantity.value =
          (data.product?.quantity != 0 ? data.product?.quantity : 1) ?? 1;
      categoryName.value = data.product?.category?.name ?? '';
      unit.value = 'KG'; //data.product?.
      image.value = data.product?.images
              ?.map((e) => Image.network(
                    formatImageUrl(e),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image,
                      size: 36,
                      color: Colors.grey,
                    ),
                  ))
              .toList() ??
          [];
      totalStock.value =
          double.tryParse(data.product?.stock.toString() ?? '0') ?? 1;
    }
    if (isNeed.value == true) {
      var response =
          await ProductDetailsRepo().onRelatedProductDetailsFetch(id: id);

      if ((response != null) && (response.isNotEmpty)) {
        relatedProducts.value = response
            .map(
              (e) => CartItemCustomModel(
                  productId: e.id!,
                  isFavorite: false,
                  name: e.name ?? '',
                  price: e.price ?? '',
                  quantity: e.quantity ?? 0,
                  id: e.id!,
                  stockQty: e.stock,
                  imageUrl: e.images),
            )
            .toList();
      } else {
        relatedProducts.value = [];
      }
    }
  }

  @override
  void onInit() {
    isNeed.value = isRelatedProductNeed;
    _initial();
    super.onInit();
  }
}
