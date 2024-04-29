import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/screens/signup/verify_email.dart';
import 'package:shopwithusama/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/helpers/helper_functions.dart';

class USignUpForm extends StatelessWidget {
  const USignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: UTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: USizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: UTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Username
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: UTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),

          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: UTexts.email,
                prefixIcon: Icon(Iconsax.direct)),
          ),

          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Phone number
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: UTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: UTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
          ),

          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Terms and conditions checkbox
          const UTermsAndConditionCheckBox(),

          const SizedBox(
            height: USizes.spaceBtwSections,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(UTexts.createAccount),
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
            ),
          )
        ],
      ),
    );
  }
}