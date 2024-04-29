// Use this class to setup themes, initial bindings, any animations and much more
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopwithusama/features/authentication/screens/onboarding/onboarding.dart';
import 'package:shopwithusama/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UAppTheme.lightTheme,
      darkTheme: UAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}