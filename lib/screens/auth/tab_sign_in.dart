// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/controller/controller.dart';
import 'package:podcast_app/screens/home/home_screen.dart';
import 'package:podcast_app/utils/color_category.dart';
import 'package:podcast_app/utils/constant_widget.dart';
import 'package:podcast_app/utils/pref_data.dart';

// ignore: must_be_immutable
class TabSignIn extends StatefulWidget {
  var pageController;
  TabSignIn(this.pageController, {super.key});

  @override
  State<TabSignIn> createState() => _TabSignInState();
}

class _TabSignInState extends State<TabSignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  HomeController controller = Get.put(HomeController());

  final loginForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          defaultTextField(
              context, emailController, "Email Address", "email.svg",
              validator: (email) {
            if (email == null || email.isEmpty) {
              return 'Please enter valid email address';
            }
            return null;
          }),
          getVerSpace(20.h),
          defaultTextField(context, passwordController, "Password", "eye.svg",
              isPass: true, validator: (password) {
            if (password == null || password.isEmpty) {
              return 'Please enter valid password';
            }
            return null;
          }),
          getVerSpace(16.h),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                //Constant.sendToNext(context, Routes.forgotPasswordRoute);
              },
              child: getCustomFont("Forgot Password", 16.sp, Colors.white, 1,
                  fontWeight: FontWeight.w400),
            ),
          ),
          getVerSpace(50.h),
          getButton(context, accentColor, "Login", Colors.black, () {
            controller.onChange(0.obs);
            PrefData.setIsSignIn(false);
            Get.to(() => const HomeScreen());
          }, 18.sp,
              buttonHeight: 60.h,
              borderRadius: BorderRadius.circular(12.h),
              weight: FontWeight.w700),
          getVerSpace(30.h),
          Row(
            children: [
              Expanded(child: getDivider(setColor: dividerColor)),
              getCustomFont("Or Continue With", 12.sp, Colors.white, 1,
                      fontWeight: FontWeight.w400)
                  .paddingSymmetric(horizontal: 20.h),
              Expanded(child: getDivider(setColor: dividerColor)),
            ],
          ),
          getVerSpace(30.h),
        ],
      ),
    );
  }
}
