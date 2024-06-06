import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopwithusama/features/authentication/controllers/signup/signup_controller.dart';
import 'package:shopwithusama/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';
import 'package:shopwithusama/utils/validators/validation.dart';

class USignUpForm extends StatelessWidget {
  const USignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.singupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => UValidator.validateEmptyText('First name', value),
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
                  controller: controller.lastName,
                  validator: (value) => UValidator.validateEmptyText('Last name', value),
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
            controller: controller.username,
            validator: (value) => UValidator.validateEmptyText('Username', value),
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
            controller: controller.email,
            validator: (value) => UValidator.validateEmail(value),
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
            controller: controller.phoneNumber,
            validator: (value) => UValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: UTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call)),
          ),

          const SizedBox(
            height: USizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => UValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: UTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value, icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))),
            ),
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
              onPressed: () => controller.signup(),
            ),
          )
        ],
      ),
    );
  }
}