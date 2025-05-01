import 'dart:io';
import 'dart:typed_data';

import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/authorised/profile_module/profile/view.dart';
import 'package:ecommerce/shared/repo/authorised/profile_repo/profile_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ProfileCreateEditController extends GetxController {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();

  RxString imageUrl = ''.obs;

  Uint8List? imageBytes;

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

  Future<void> onSave({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String city,
    required String pinCode,
  }) async {
    http.MultipartFile? profilePic;
    if (imageBytes != null) {
      profilePic = http.MultipartFile.fromBytes(
        'u_profile_pic', // This should match the key expected by your backend
        imageBytes!,
        filename:
            'profile.jpg', // You can adjust the file name or handle dynamically
        contentType: MediaType('image', 'jpeg'), // Set appropriate MIME type
      );
    }
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
      Navigator.push(knNavGlobalKey.currentContext!,
          MaterialPageRoute(builder: (context) =>  NavScreen(index: 2,)));
    }
  }
}
