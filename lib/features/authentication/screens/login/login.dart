import 'package:flutter/material.dart';
import 'package:shopwithusama/common/styles/spacing_styles.dart';
import 'package:shopwithusama/common/widgets/login_signup/form_divider.dart';
import 'package:shopwithusama/common/widgets/login_signup/social_button.dart';
import 'package:shopwithusama/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shopwithusama/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shopwithusama/utils/constants/sizes.dart';
import 'package:shopwithusama/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: USpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo title and sub-title
              ULoginHeader(),

              /// Form contain email, password and buttons
              ULoginForm(),

              /// Divider
              UFormDivider(
                dividerText: UTexts.orSignInWith,
              ),

              SizedBox(
                height: USizes.spaceBtwSections,
              ),

              /// Footer
              USocialButton()
            ],
          ),
        ),
      ),
    );
  }
}
