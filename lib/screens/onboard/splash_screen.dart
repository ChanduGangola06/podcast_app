import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/screens/auth/login_screen.dart';
import 'package:podcast_app/screens/home/home_screen.dart';
import 'package:podcast_app/screens/onboard/intro_screen.dart';
import 'package:podcast_app/utils/color_category.dart';
import 'package:podcast_app/utils/constant.dart';
import 'package:podcast_app/utils/constant_widget.dart';
import 'package:podcast_app/utils/pref_data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getIsFirst();
  }

  _getIsFirst() async {
    bool isSignIn = await PrefData.getIsSignIn();
    bool isIntro = await PrefData.getIsIntro();

    Timer(
      const Duration(seconds: 3),
      () {
        if (isIntro) {
          Get.to(() => const IntroScreen());
        } else if (isSignIn) {
          Get.to(() => const LoginScreen());
        } else {
          Get.to(() => const HomeScreen());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgDark);
    Constant.setupSize(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: bgDark,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getAssetImage("splash_logo.png", width: 106.h, height: 137.h),
            ],
          ),
        ),
      ),
    );
  }
}
