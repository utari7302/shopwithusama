import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/common/widgets/login_signup/form_divider.dart';
import 'package:shopwithusama/common/widgets/login_signup/social_button.dart';
import 'package:shopwithusama/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                UTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Form
              const USignUpForm(),
              const SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Divider
              UFormDivider(dividerText: UTexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: USizes.spaceBtwSections,
              ),
              const USocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
