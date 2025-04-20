import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/order_details_page/controller.dart';
import 'package:ecommerce/module/authorised/order_details_page/responsive/order_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key, required this.id});
  final int id;

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late OrderDetailsPageController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(OrderDetailsPageController(id: widget.id), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<OrderDetailsPageController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  OrderDetailsPageScreen(controller: controller,);
  }
}
