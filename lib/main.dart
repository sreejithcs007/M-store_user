import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/module/unauthorised/authentication/login/login.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/module/unauthorised/onboard_screen.dart';
import 'package:flutter/material.dart';

// Import your screens
void main() => runApp(const GroceryApp());

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: knNavGlobalKey ,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const GroceryPromoScreen(),
        '/login': (_) => const LoginView(),
      },
    );
  }
}
