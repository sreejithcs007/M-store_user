import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/view_all/controller.dart';
import 'package:ecommerce/module/authorised/view_all/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  late ViewAllController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(ViewAllController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ViewAllController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewAllMobileScreen(
      controller: controller,
    );
  }
}
