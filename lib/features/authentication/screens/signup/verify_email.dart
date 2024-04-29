import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/success_screen/success_screen.dart';
import 'package:shopwithusama/features/authentication/screens/login/login.dart';
import 'package:shopwithusama/utils/constants/image_strings.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                UTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),
              Text(
                "support@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),
              Text(
                UTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: USizes.spaceBtwItems,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: UImages.staticSuccessIlustration,
                        title: UTexts.yourAccountCreatedTitle,
                        subTitle: UTexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                  child: const Text(UTexts.tContinue),
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
      ),
    );
  }
}
