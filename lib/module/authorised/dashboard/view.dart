import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/dashboard/controller.dart';
import 'package:ecommerce/module/authorised/dashboard/responsive/dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late DashboardController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(DashboardController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DashboardController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(controller: controller,);
  }
}