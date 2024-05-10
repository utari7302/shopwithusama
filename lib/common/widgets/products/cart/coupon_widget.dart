import 'package:flutter/material.dart';
import 'package:shopwithusama/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UCouponCode extends StatelessWidget {
  const UCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      backgroundColor: dark ? UColors.dark : UColors.white,
      padding: const EdgeInsets.only(
          top: USizes.sm,
          bottom: USizes.sm,
          right: USizes.sm,
          left: USizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? UColors.white.withOpacity(0.5) : UColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              onPressed: () {},
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}