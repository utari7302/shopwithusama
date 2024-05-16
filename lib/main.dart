import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopwithusama/app.dart';
import 'package:shopwithusama/data/repositories/authentication/authentication_repository.dart';
import 'package:shopwithusama/firebase_options.dart';

// Entry point of flutter app
Future<void> main() async {

  // Todo: Add Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Todo: Init Local Storage
  await GetStorage.init();
  // Todo: Await Native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Todo: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  // Todo: Initialize Authentication

  // Load all the Material Design / Themes / Localizations / Bindings
  runApp(const App());
}



