import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/screens/auth/reset_password.dart';

import '../../utils/color_category.dart';
import '../../utils/constant.dart';
import '../../utils/constant_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  void backClick() {
    Constant.backToPrev(context);
  }

  TextEditingController emailController = TextEditingController();
  final forgotForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgDark);
    Constant.setupSize(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: bgDark,
        body: SafeArea(
          child: Form(
            key: forgotForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                getVerSpace(50.h),
                getToolbarWithIcon(() {
                  backClick();
                }),
                getVerSpace(40.h),
                getCustomFont("Forgot Password", 26.sp, Colors.white, 1,
                    fontWeight: FontWeight.w700),
                getVerSpace(50.h),
                defaultTextField(context, emailController, "Email", "email.svg",
                    validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Please enter valid email address';
                  }
                  return null;
                }),
                getVerSpace(50.h),
                getButton(context, accentColor, "Submit", Colors.black, () {
                  Get.to(() => const ResetPassword());
                }, 18.sp,
                    buttonHeight: 60.h,
                    borderRadius: BorderRadius.circular(12.h),
                    weight: FontWeight.w700),
              ],
            ).paddingSymmetric(horizontal: 20.h),
          ),
        ),
      ),
    );
  }
}
