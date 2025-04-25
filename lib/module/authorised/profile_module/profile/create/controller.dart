import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCreateEditController extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();

  RxString imageUrl = ''.obs;

  @override
  void onInit() {
    _initial();
    super.onInit();
  }

  Future<void> _initial() async {
    var response = await ProfileRepo().onProfileFetch();

    if (response != null) {
      imageUrl.value = response.uProfilePic ?? '';
      nameController.text = response.uName ?? '';
      addressController.text = response.uAddress ?? '';
      phoneNoController.text = response.uPhone ?? '';
      emailController.text = response.uEmail ?? '';
      stateController.text = '';
      cityController.text = response.city ?? '';
      pinCodeController.text = response.pinCode ?? '';
    }
  }

  Future<void> onSave(
      {required String name,
      required String address,
      required String phone,
      required String email,
      required String city,
      required String pinCode,
      required String profilePic}) async {
    var response = await ProfileRepo().onProfileUpdate(
        address: address,
        city: city,
        email: email,
        name: name,
        phone: phone,
        pinCode: pinCode,
        profilePic: profilePic);

    if (response?.status == 200) {
      fnShowSnackBarSucess('Updated successfully');
      Navigator.pop(knNavGlobalKey.currentContext!);
    }
  }
}
