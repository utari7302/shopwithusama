import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/controllers/login/login_controller.dart';
import 'package:shopwithusama/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:shopwithusama/features/authentication/screens/signup/signup.dart';
import 'package:shopwithusama/features/personalization/controllers/user_controller.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => UValidator.validateEmail(value),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: UTexts.email),
                ),
                const SizedBox(
                  height: USizes.spaceBtwInputFields,
                ),
                Obx(
                      () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) => UValidator.validatePassword(value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Iconsax.password_check),
                        labelText: UTexts.password,
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye))),
                  ),
                ),
                const SizedBox(
                  height: USizes.spaceBtwSections,
                ),


                /// Verify button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('Verify')),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
