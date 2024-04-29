import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            /// Image
            Image(
              image: const AssetImage(UImages.deliveredEmailIlustration),
              width: UHelperFunctions.screenWidth() * 0.6,
            ),

            /// Title & SubTitle
            Text(
              UTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),
            Text(
              UTexts.changeYourPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: USizes.spaceBtwItems,
            ),

            /// Buttons
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(UTexts.done),
              ),
            ),
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                child: const Text(UTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
