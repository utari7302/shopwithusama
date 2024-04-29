import 'package:flutter/material.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class ULoginHeader extends StatelessWidget {
  const ULoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(
              dark ? UImages.lightAppLogo : UImages.darkAppLogo),
        ),
        Text(
          UTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: USizes.sm,
        ),
        Text(
          UTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}