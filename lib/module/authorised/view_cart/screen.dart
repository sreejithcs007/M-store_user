import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/view_cart/controller.dart';
import 'package:ecommerce/module/authorised/view_cart/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => CartViewState();
}

class CartViewState extends State<CartView> {
  late CartViewController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(CartViewController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<CartViewController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartViewMobile(
      controller: controller,
    );
  }
}
