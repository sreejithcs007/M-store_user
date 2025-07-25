import 'package:ecommerce/core/constants/global_keys.dart/keys.dart';
import 'package:ecommerce/core/db/hive_helper.dart';
import 'package:ecommerce/core/db/hive_keys.dart';
import 'package:ecommerce/core/db/model/onboard/onboard.dart';
import 'package:ecommerce/core/db/model/user_details/user.dart';
import 'package:ecommerce/core/dev_tools/dev_tools.dart';
import 'package:ecommerce/module/authorised/bottom_navbar/bottom_navbar.dart';
import 'package:ecommerce/module/unauthorised/authentication/view.dart';
import 'package:ecommerce/module/unauthorised/onboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

// Import your screens
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDetailsHiveAdapter());
  Hive.registerAdapter(OnBoardScreenHiveModelAdapter());
  await Hive.openBox<UserDetailsHive>(DbKeys.userDetails);
  await Hive.openBox<OnBoardScreenHiveModel>(DbKeys.user1Details);
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    // devPrintError(
    //     'GetHiveHelper.getOnBoardDetailsHive()?.isSeen == ${GetHiveHelper.getOnBoardDetailsHive()?.isSeen}');
    return MaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.(), // Set Poppins as default
      // ),
      navigatorKey: knNavGlobalKey,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/': (_) => const GroceryPromoScreen(),
      //   // '/login': (_) =>  const ProductListScreen(),
      //   '/login': (_) => const LoginView(),
      // },
      home: GetHiveHelper.getOnBoardDetailsHive()?.isSeen == null
          ? const GroceryPromoScreen()
          : GetHiveHelper.getUserDetailsHive()?.accessToken == null
              ? const LoginView()
              :  NavScreen(),
    );
  }
}
