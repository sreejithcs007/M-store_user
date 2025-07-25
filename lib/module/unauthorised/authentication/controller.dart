import 'package:ecommerce/core/db/hive_box_helper.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/shared/model/unauthorised/login_model/data.dart';
import 'package:ecommerce/shared/model/unauthorised/signup_model/signup_model.dart';
import 'package:ecommerce/shared/repo/login_repo/login_repo.dart';
import 'package:ecommerce/shared/repo/login_repo/signup_repo.dart';
import 'package:ecommerce/widget/snack_bar/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isSignInLoading = false.obs;
  RxBool isSignUpLoading = false.obs;
  RxBool showSignUpPass = false.obs;
  RxBool showSignInPass = false.obs;
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  final signUpNameController = TextEditingController();
  final signUpEmailController = TextEditingController();
  final signUpPhoneController = TextEditingController();
  final signUpAddressController = TextEditingController();
  final signUpLocationController = TextEditingController();
  final signUpPinCodeController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();
  final signUpFormKey = GlobalKey<FormState>();

  void showSignUPPass() {
    showSignUpPass.value = !showSignUpPass.value;
  }

  void showSignINPass() {
    showSignInPass.value = !showSignInPass.value;
  }

  Future<void> onSignInPressed(BuildContext context,
      {required String email, required String password}) async {
    // devPrintError(
    //     'formKey.currentState!.validate() ==${loginFormKey.currentState!.validate()}');
    isSignInLoading.value = true;
    if (loginFormKey.currentState!.validate()) {
      var response =
          await LoginRepo().onLogin(email: email, password: password);


      // devPrintSuccess('response?==$response');
      // devPrintSuccess('response?.status==${response?.status}');
      // devPrintSuccess('response?.data==${response?.data}');
      // devPrintSuccess('response?.msg==${response?.msg}');
      if (response?.status == 200) {
        var data = LoginModel.fromJson(response?.data);

        await setDataToLocal(data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  NavScreen()),
        );

        fnShowSnackBarSucess('Successfully logged in');
      } else {
        fnShowSnackBarError('please check your Credentilas');
      }
    } else {
      fnShowSnackBarError('please fill the fields');
    }

    isSignInLoading.value = false;
  }

  Future<void> onSignUp(BuildContext context,
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    isSignUpLoading.value = true;
    if (signUpFormKey.currentState!.validate()) {
      var response = await SignUpRepo().onSignUp(
          email: email,
          password: password,
          name: name,
          phone: phone,
          address: address);

      if (response?.status == 201) {
        fnShowSnackBarSucess('Created successfully');
        var data = SignUpModel.fromJson(response?.data);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginView()));
      }
    } else {
      fnShowSnackBarError('Please fill the fields');
    }
    isSignUpLoading.value = false;
  }
}

Future<void> setDataToLocal(LoginModel data) async {
  try {
    if (data.token != null && data.status == 'success') {
      var res = data.data;
      var box = HiveHelper.getUserDetailsHiveBox();
      var Id = UserDetailsHive(
          id: res?.userId,
          userEmail: res!.email!,
          userPhoneNo: res.phone!,
          accessToken: data.token!);

      box.put(DbKeys.userKey, Id);

      // devPrintSuccess(
      //     'GetHiveHelper= ${GetHiveHelper.getUserDetailsHive()!.accessToken}');
    }
  } catch (e) {
    devPrintError('set data to local catch error == $e');
  }
}

Future<void> setDataToLocalOboard(OnBoardScreenHiveModel data) async {
  try {
    // var res = data.data;
    // var box = HiveHelper.getUserDetailsHiveBox();
    // var Id = UserDetailsHive(
    //     id: res?.userId,
    //     userEmail: res!.email!,
    //     userPhoneNo: res.phone!,
    //     accessToken: data.token!);
    var box = HiveHelper.getOnboardDetailsHiveBox();
    var Id = OnBoardScreenHiveModel(isSeen: true);
    box.put(DbKeys.user1Key, Id);

    // devPrintSuccess(
    //     'GetHiveHelper= ${GetHiveHelper.getOnBoardDetailsHive()?.isSeen}');
  } catch (e) {
    devPrintError('set data to local catch error == $e');
  }
}
