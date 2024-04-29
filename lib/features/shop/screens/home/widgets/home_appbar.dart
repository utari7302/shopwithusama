import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/appbar/appbar.dart';
import 'package:shopwithusama/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            UTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: UColors.grey),
          ),
          Text(
            UTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: UColors.white),
          ),
        ],
      ),
      actions: [
        UCartCounterIcon(
          iconColor: UColors.white,
          onPressed: () {},
        )
      ],
    );
  }
}
