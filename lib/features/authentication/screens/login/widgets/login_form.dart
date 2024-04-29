import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shopwithusama/features/authentication/screens/signup/signup.dart';
import 'package:shopwithusama/navigation_menu.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

class ULoginForm extends StatelessWidget {
  const ULoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: USizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: UTexts.email),
            ),
            const SizedBox(
              height: USizes.spaceBtwInputFields,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: UTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash)),
            ),
            const SizedBox(
              height: USizes.spaceBtwInputFields / 2,
            ),

            /// Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Text(UTexts.rememberMe)
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(()=> const ForgetPassword()),
                  child: const Text(UTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(
              height: USizes.spaceBtwSections,
            ),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()), child: const Text(UTexts.signIn)),
            ),
            const SizedBox(
              height: USizes.spaceBtwItems,
            ),

            /// Create account button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(const SignUpScreen()),
                  child: const Text(UTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}