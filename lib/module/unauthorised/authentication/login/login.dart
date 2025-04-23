import 'package:ecommerce/core/constants/text_style.dart';
import 'package:ecommerce/module/unauthorised/authentication/controller.dart';
import 'package:ecommerce/module/unauthorised/authentication/forgot_pwrd/forgot_pass.dart';
import 'package:ecommerce/module/unauthorised/authentication/sign_up/signup.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller;

  const LoginScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sign-in", style: AppTextStyle().br32w400),
                const SizedBox(height: 28),

                // Email Field
                LabeledTextField(
                  label: "Mail Id",
                  hintText: "sampleemail@email.com",
                  controller: controller.loginEmailController,
                  validator: (p0) {
                    if ((p0 == null) || (p0.isEmpty)) {
                      return 'please fill this field';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                Obx(
                  () => LabeledTextField(
                    label: "Password",
                    hintText: "********",
                    obscureText: controller.showSignInPass.value ? false : true,
                    controller: controller.loginPasswordController,
                    validator: (p0) {
                      if ((p0 == null) || (p0.isEmpty)) {
                        return 'please fill this field';
                      } else {
                        return null;
                      }
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.showSignINPass();
                        },
                        icon: controller.showSignInPass.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign In Button
                Obx(
                  () => SizedBox(
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
                        controller.onSignInPressed(context,
                            email: controller.loginEmailController.text,
                            password: controller.loginPasswordController.text);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign In",
                              style: AppTextStyle()
                                  .br16w400
                                  .copyWith(color: Colors.white)),
                          const Gap(10),
                          controller.isSignInLoading.value
                              ? const SizedBox(
                                  height: 14,
                                  width: 14,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                              : const Icon(
                                  Icons.arrow_forward,
                                  size: 18,
                                  color: Colors.white,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Forgot Password
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: Text(
                      "Forgot password",
                      style: AppTextStyle()
                          .br16w400
                          .copyWith(color: const Color(0xFFEE9700)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Sign Up Redirect
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen(
                                  controller: controller,
                                )),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Dont Have an account?\n",
                        style: AppTextStyle().br16w600.copyWith(height: 3),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: AppTextStyle()
                                .br16w600
                                .copyWith(color: const Color(0xFFEE9700)),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
