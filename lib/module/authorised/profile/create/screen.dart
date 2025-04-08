import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/profile/create/controller.dart';
import 'package:ecommerce/module/authorised/profile/create/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCreateEditScreen extends StatefulWidget {
  const ProfileCreateEditScreen({super.key});

  @override
  State<ProfileCreateEditScreen> createState() =>
      _ProfileCreateEditScreenState();
}

class _ProfileCreateEditScreenState extends State<ProfileCreateEditScreen> {
  late ProfileCreateEditController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(ProfileCreateEditController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProfileCreateEditController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ProfileCreateMobile(controller: controller,);
  }
}
