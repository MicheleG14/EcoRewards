import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.controller,
      required this.screens,
      required this.items});

  final PersistentTabController controller;
  final List<Widget> screens;
  final List<PersistentBottomNavBarItem> items;

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: screens,
      items: items,
      confineInSafeArea: true,
      backgroundColor: Colors.green,
      navBarStyle: NavBarStyle.style6,
      navBarHeight: 65,
    );
  }
}
