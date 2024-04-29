import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/utils/constants/colors.dart';

class UCartCounterIcon extends StatelessWidget {
  const UCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: UColors.black,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '9',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: UColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        )
      ],
    );
  }
}
