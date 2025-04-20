import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/details_page/screen.dart';
import 'package:ecommerce/module/authorised/view_cart/screen.dart';
import 'package:ecommerce/shared/model/cart_item/cart_item_model.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:ecommerce/shared/repo/authorised/products_by_category/product_category_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreenController extends GetxController {
  RxBool isList = false.obs;
  RxBool isProductLoading = false.obs;
  int? index;
  int? id;
  ProductListScreenController(this.index, this.id);
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final tabs = <String>[
    'Vegetables',
    'Fruits',
    'Stationery',
  ];

  RxList<CartItemCustomModel> productsPerTab = <CartItemCustomModel>[].obs;

  void onCartTap(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CartView(),
        ));
  }

  void onTap({required int index, required int id}) async {
    isProductLoading.value = true;
    var responnse = await ProductCategoryRepo().onProductCategoryFetch(id: id);

    if ((responnse != null) && (responnse.isNotEmpty)) {
      productsPerTab.value = responnse
          .map(
            (e) => CartItemCustomModel(
              productId: e.id!,
              isFavorite: false,
              name: e.name ?? '',
              price: e.price ?? '',
              quantity: e.quantity ?? 0,
              id: e.id!,
              // imageUrl: e.images as List<String> 
            ),
          )
          .toList();
    } else {
      productsPerTab.value = [];
    }
    isProductLoading.value = false;
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

  @override
  void onInit() {
    _initial();
    // TODO: implement onInit
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
    if (index == null) {
      onTap(index: 0, id: categories.value[0].id!);
    } else {
      onTap(index: index!, id: id!);
    }
  }
}
