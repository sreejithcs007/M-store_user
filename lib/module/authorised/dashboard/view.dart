import 'package:ecommerce/module/authorised/dashboard/responsive/dashboard_view.dart';
import 'package:ecommerce/widget/responsive/responsive_view.dart';
import 'package:flutter/material.dart';

class MyResponsiveScreen extends StatelessWidget {
  const MyResponsiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: DashboardScreen(),
      tablet: DashboardScreen(),
      web: DashboardScreen(),
    );
  }
}