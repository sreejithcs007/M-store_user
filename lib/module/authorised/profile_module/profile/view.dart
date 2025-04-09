import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/controller.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/responsive/mobile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  late ProfileController controller;
  final tag = fnTagGenerator();

  @override
  void initState() {
    controller = Get.put(ProfileController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ProfileController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileMobileScreen(
      controller: controller,
    );
  }
}
