import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';
import 'package:ecommerce/module/authorised/dashboard/view.dart';
import 'package:ecommerce/module/authorised/product_list_Screen.dart/screen.dart';
import 'package:ecommerce/module/authorised/view_all_category/screen.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/module/unauthorised/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

// Import your screens
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsHiveAdapter());
  await Hive.openBox<UserDetailsHive>(DbKeys.userDetails);
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.(), // Set Poppins as default
      // ),
      navigatorKey: knNavGlobalKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const GroceryPromoScreen(),
        // '/login': (_) =>  const ViewAllScreen(),
        '/login': (_) =>  const LoginView(),
      },
      // home: ,
    );
  }
}
