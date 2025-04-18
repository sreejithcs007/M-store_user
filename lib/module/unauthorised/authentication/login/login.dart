import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/unauthorised/authentication/controller.dart';
import 'package:ecommerce/module/unauthorised/authentication/forgot_pwrd/forgot_pass.dart';
import 'package:ecommerce/module/unauthorised/authentication/sign_up/signup.dart';
import 'package:ecommerce/widget/textfields/custom_textfield.dart';
import 'package:flutter/material.dart';

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
                const Text(
                  "Sign-in",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 28),

                // Email Field
                LabeledTextField(
                  label: "Mail Id",
                  hintText: "sampleemail@email.com",
                  controller: controller.loginEmailController,
                  validator: (p0) {
                    if ((p0 == null) || (p0!.isEmpty)) {
                      return 'please fill this field';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                LabeledTextField(
                  label: "Password",
                  hintText: "********",
                  obscureText: true,
                  controller: controller.loginPasswordController,
                  validator: (p0) {
                    devPrintError('p0==${p0}');
                    if ((p0 == null) || (p0!.isEmpty)) {
                      return 'please fill this field';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 30),

                // Sign In Button
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
                      controller.onSignInPressed(context,
                          email: controller.loginEmailController.text,
                          password: controller.loginPasswordController.text);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign In", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward, size: 18),
                      ],
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
                    child: const Text(
                      "Forgot password",
                      style: TextStyle(color: Color(0xFFF59E0B)),
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
                        MaterialPageRoute(builder: (context) => SignUpScreen(controller: controller,)),
                      );
                    },
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Dont Have an account?\n",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              color: Color(0xFFF59E0B),
                              fontWeight: FontWeight.bold,
                            ),
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
