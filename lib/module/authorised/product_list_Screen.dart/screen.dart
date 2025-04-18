import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/controller.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.index});
  final int? index;

  @override
  State<ProductListScreen> createState() => ProductListScreenState();
}

class ProductListScreenState extends State<ProductListScreen> {
  late ProductListScreenController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(ProductListScreenController(widget.index), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProductListScreenController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShoppingPage(
      controller: controller,
    );
  }
}
