import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {

            },
            icon: const Image(
              width: USizes.iconMd,
              height: USizes.iconMd,
              image: AssetImage(
                  UImages.facebook
              ),
            ),
          ),
        ),
        const SizedBox(width: USizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: UColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {

            },
            icon: const Image(
              width: USizes.iconMd,
              height: USizes.iconMd,
              image: AssetImage(
                  UImages.google
              ),
            ),
          ),
        ),
      ],
    );
  }
}