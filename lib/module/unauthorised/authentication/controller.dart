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
  Future<void> onSignInPressed(BuildContext context,
      {required String email, required String password}) async {
    devPrintError(
        'formKey.currentState!.validate() ==${loginFormKey.currentState!.validate()}');
    if (loginFormKey.currentState!.validate()) {
      var response =
          await LoginRepo().onLogin(email: email, password: password);
      devPrintSuccess('response?.status==${response?.status}');
      devPrintSuccess('response?.data==${response?.data}');
      devPrintSuccess('response?.msg==${response?.msg}');
      if (response?.status == 200) {
        var data = LoginModel.fromJson(response?.data);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavScreen()),
        );

        fnShowSnackBarSucess('Successfully logged in');
      }
    } else {
      fnShowSnackBarError('please check your credentials');
    }
  }

  Future<void> onSignUp(BuildContext context,
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String address}) async {
    var response = await SignUpRepo().onSignUp(
        email: email,
        password: password,
        name: name,
        phone: phone,
        address: address);

    if (response?.status == 200) {
      fnShowSnackBarSucess('Created successfully');
      var data = SignUpModel.fromJson(response?.data);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    } else {
      fnShowSnackBarError('Please fill the fields');
    }
  }
}
