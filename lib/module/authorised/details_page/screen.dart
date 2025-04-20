import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/details_page/controller.dart';
import 'package:ecommerce/module/authorised/details_page/responsive/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreenView extends StatefulWidget {
  const DetailsScreenView({super.key, required this.id,this.isRelatedProductNeed = true});
  final int id;
  final bool isRelatedProductNeed;

  @override
  State<DetailsScreenView> createState() => DetailsScreenStateView();
}

class DetailsScreenStateView extends State<DetailsScreenView> {
  late ProductDetailController controller;
  final String tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(ProductDetailController(id: widget.id,isRelatedProductNeed: widget.isRelatedProductNeed), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProductDetailController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProductDetailScreen(
      controller: controller,
    );
  }
}
