import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/screens/onboard/splash_screen.dart';

import 'controller/app_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(context: context),
      home: const SplashScreen(),
    );
  }
}
