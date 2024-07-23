import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:shopwithusama/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

import '../../../../utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            Text(
              UTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),
            Text(
              UTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: USizes.spaceBtwSections * 2,
            ),

            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => UValidator.validateEmail(value),
                decoration: const InputDecoration(
                    labelText: UTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: USizes.spaceBtwSections,
            ),

            /// Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(UTexts.submit),
              ),
            )
          ],
        ),
      ),
    );
  }
}
