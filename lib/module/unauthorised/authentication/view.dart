import 'package:ecommerce/core/utils/tag_generator/helper.dart';
import 'package:ecommerce/module/unauthorised/authentication/controller.dart';
import 'package:ecommerce/module/unauthorised/authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late LoginController controller;
  final String tag = fnTagGenerator();
  @override
  void initState() {
    controller = Get.put(LoginController(), tag: tag);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<LoginController>(tag: tag);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen(controller: controller);
  }
}
