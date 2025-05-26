import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/screen.dart';
import 'package:ecommerce/shared/model/categories/model.dart';
import 'package:ecommerce/shared/repo/authorised/dashboard_repo/dash_board_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  void onCategoryContainerTap({required int index, required int id}) {
    // Navigator.push(
    //   knNavGlobalKey.currentContext!,
    //   MaterialPageRoute(
    //     builder: (_) => ProductListScreen(
    //       index: index,
    //       id: id,
    //     ),
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

  Future<void> _initial() async {
    isLoading.value = true;
    var categoryResponse = await DashBoardRepo().onCategoryFetch();
    if ((categoryResponse != null) && (categoryResponse.isNotEmpty)) {
      categories.value = categoryResponse
          .map(
            (e) => CategoryModel(
                categoryName: e.name ?? '', imageUrl: e.image ?? '', id: e.id),
          )
          .toList();
    }

    isLoading.value = false;
  }
}
