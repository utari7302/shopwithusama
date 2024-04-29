import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/device/device_utility.dart';

class UAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UAppBar(
      {super.key,
      this.title, this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadinggOnPressed});

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadinggOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: USizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left))
            : leadingIcon != null ? IconButton(
                onPressed: () => leadinggOnPressed, icon: Icon(leadingIcon)) : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(UDeviceUtility.getAppBarHeight());
}
