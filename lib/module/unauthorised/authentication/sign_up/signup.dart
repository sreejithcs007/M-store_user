import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/unauthorised/authentication/controller.dart';
import 'package:ecommerce/module/unauthorised/authentication/login/login.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreen extends StatelessWidget {
  final LoginController controller;

  SignUpScreen({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Center(
                  child: Form(
                    key: controller.signUpFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sign-UP", style: AppTextStyle().br32w400),
                        const SizedBox(height: 28),

                        LabeledTextField(
                          label: "Name",
                          hintText: "Name",
                          controller: controller.signUpNameController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Mail Id",
                          hintText: "sampleemail@email.com",
                          controller: controller.signUpEmailController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Phone No",
                          hintText: "Phone No",
                          controller: controller.signUpPhoneController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Address",
                          hintText: "Address",
                          controller: controller.signUpAddressController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Location",
                          hintText: "Location",
                          controller: controller.signUpLocationController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Pin-code",
                          hintText: "Pin-code",
                          controller: controller.signUpPinCodeController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        LabeledTextField(
                          label: "Password",
                          hintText: "********",
                          obscureText: true,
                          controller: controller.signUpPasswordController,
                          validator: (p0) {
                            devPrintError('p0==${p0}');
                            if ((p0 == null) || (p0!.isEmpty)) {
                              return 'please fill this field';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: 28),

                        // Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF59E0B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              controller.onSignUp(context,
                                  email: controller.signUpEmailController.text,
                                  name: controller.signUpNameController.text,
                                  address:
                                      controller.signUpAddressController.text,
                                  password:
                                      controller.signUpPasswordController.text,
                                  phone: controller.signUpPhoneController.text);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sign Up",
                                    style: AppTextStyle()
                                        .br16w400
                                        .copyWith(color: Colors.white)),
                                const Gap(10),
                                const Icon(Icons.arrow_forward, size: 18,color: Colors.white,),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginView()),
                              );
                            },
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Already Have an Account?\n",
                                style:
                                    AppTextStyle().br16w600.copyWith(height: 3),
                                children: [
                                  TextSpan(
                                      text: "Sign In",
                                      style: AppTextStyle().br16w600.copyWith(
                                          color: const Color(0xFFEE9700))),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
