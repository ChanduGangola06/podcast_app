import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/screens/auth/tab_sign_in.dart';
import 'package:podcast_app/screens/auth/tab_sign_up.dart';
import 'package:podcast_app/utils/color_category.dart';
import 'package:podcast_app/utils/constant.dart';
import 'package:podcast_app/utils/constant_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  var tabController;
  var pController;

  void backClick() {
    Constant.closeApp();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    pController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgDark);
    Constant.setupSize(context);
    return PopScope(
      child: Scaffold(
        backgroundColor: bgDark,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              getVerSpace(50.h),
              getToolbarWithIcon(() {
                backClick();
              }).paddingSymmetric(horizontal: 20.h),
              getVerSpace(40.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                height: 60.h,
                decoration: BoxDecoration(
                  color: unselect_color,
                  borderRadius: BorderRadius.circular(22.h),
                ),
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 5.h),
                  labelStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: Constant.fontsFamily),
                  labelColor: accentColor,
                  unselectedLabelStyle: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: Constant.fontsFamily),
                  indicator: ShapeDecoration(
                      color: select_color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.h))),
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: "Login ",
                    ),
                    Tab(
                      text: "Sign Up",
                    ),
                  ],
                  onTap: (value) {
                    pController.animateToPage(value,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                ),
              ),
              getVerSpace(30.h),
              Expanded(
                flex: 1,
                child: PageView(
                  controller: pController,
                  onPageChanged: (value) {
                    tabController.animateTo(value,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  },
                  children: [
                    TabSignIn(pController),
                    TabSignUp(pController),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
