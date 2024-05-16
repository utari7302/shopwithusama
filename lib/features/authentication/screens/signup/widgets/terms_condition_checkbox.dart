import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shopwithusama/utils/constants/colors.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class UTermsAndConditionCheckBox extends StatelessWidget {
  const UTermsAndConditionCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value ,
            ),
          ),
        ),
        const SizedBox(
          width: USizes.spaceBtwItems,
        ),
        Text.rich(TextSpan(children: [
          TextSpan(
              text: '${UTexts.iAgreeTo} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${UTexts.privacyPolicy} ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color:
                dark ? UColors.white : UColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? UColors.white : UColors.primary,
              )),
          TextSpan(
              text: '${UTexts.and} ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
              text: '${UTexts.termsOfUse} ',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(
                color:
                dark ? UColors.white : UColors.primary,
                decoration: TextDecoration.underline,
                decorationColor:
                dark ? UColors.white : UColors.primary,
              )),
        ]))
      ],
    );
  }
}