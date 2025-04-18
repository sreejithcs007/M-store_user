import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/my_orders/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late MyOrderController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(MyOrderController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MyOrderController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyOrderMobileScreen(
      controller: controller,
    );
  }
}
