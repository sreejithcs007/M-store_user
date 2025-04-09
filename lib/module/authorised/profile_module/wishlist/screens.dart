import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/wishlist/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late WishlistController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(WishlistController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<WishlistController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WishlistMobileScreen(
      controller: controller,
    );
  }
}
