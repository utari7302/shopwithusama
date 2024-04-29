import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/device/device_utility.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return TabBar(
      tabs: tabs,
      tabAlignment: TabAlignment.start,
      indicatorColor: UColors.primary,
      unselectedLabelColor: UColors.darkGrey,
      labelColor: dark ? UColors.white : UColors.primary,
      isScrollable: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtility.getAppBarHeight());
}
