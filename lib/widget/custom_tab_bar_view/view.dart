import 'package:flutter/material.dart';

class CustomTabView extends StatelessWidget {
  const CustomTabView({super.key, required this.tabCount, required this.tabs, required this.tabViews});
  final int tabCount;
  final List<Widget> tabs;
  final List<Widget> tabViews;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabCount, // 👈 update this if more tabs needed
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xFFEE9700),
            tabs: tabs,
          ),
           Expanded(
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
