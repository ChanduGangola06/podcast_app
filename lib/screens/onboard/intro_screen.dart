import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:podcast_app/controller/controller.dart';
import 'package:podcast_app/dataFile/data_file.dart';
import 'package:podcast_app/model/introl_model.dart';
import 'package:podcast_app/screens/auth/login_screen.dart';
import 'package:podcast_app/utils/color_category.dart';
import 'package:podcast_app/utils/constant.dart';
import 'package:podcast_app/utils/constant_widget.dart';
import 'package:podcast_app/utils/pref_data.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  backClick() {
    Constant.closeApp();
  }

  PageController controller = PageController(initialPage: 0);
  IntroController introController = Get.put(IntroController());
  List<ModelIntro> introLists = DataFile.introList;

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgDark);
    Constant.setupSize(context);
    return PopScope(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller,
                    itemCount: introLists.length,
                    itemBuilder: (context, index) {
                      ModelIntro modelIntro = introLists[index];
                      return Column(
                        children: [
                          getAssetImage(modelIntro.image,
                              height: 532.h, width: double.infinity),
                          getVerSpace(20.h),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: getRichText(
                                  modelIntro.firstText,
                                  Colors.white,
                                  FontWeight.w700,
                                  34.sp,
                                  modelIntro.secondText,
                                  accentColor,
                                  FontWeight.w700,
                                  34.sp,
                                  modelIntro.thirdText,
                                  Colors.white,
                                  FontWeight.w700,
                                  34.sp,
                                  txtHeight: 1.5.h,
                                  textAlign: TextAlign.start,
                                ).paddingSymmetric(horizontal: 30.h),
                              ),
                              getVerSpace(31.h),
                            ],
                          ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      _onPageViewChange(index);
                    },
                  ),
                ),
                GetBuilder<IntroController>(
                  init: IntroController(),
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introLists.length,
                        (index) {
                          return getSvgImage(
                                  index == controller.position.value
                                      ? "select_dot.svg"
                                      : "unselect_dot.svg",
                                  width: 8.h,
                                  height: 8.h)
                              .paddingOnly(
                            left: index == 0 ? 0 : 4.h,
                            right: 5.h,
                          );
                        },
                      ),
                    );
                  },
                ),
                getVerSpace(20.h),
                GetBuilder<IntroController>(
                  init: IntroController(),
                  builder: (introController) => getButton(
                          context,
                          accentColor,
                          (introController.position.value ==
                                  introLists.length - 1)
                              ? "Get started"
                              : "Next",
                          Colors.black, () {
                    if (introController.position.value ==
                        introLists.length - 1) {
                      PrefData.setIsIntro(false);
                      Get.to(() => const LoginScreen());
                    } else {
                      controller.jumpToPage(introController.position.value + 1);
                    }
                  }, 18.sp,
                          weight: FontWeight.w700,
                          buttonHeight: 60.h,
                          borderRadius: BorderRadius.circular(12.h))
                      .marginSymmetric(horizontal: 20.h),
                ),
                getVerSpace(30.h),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      PrefData.setIsIntro(false);
                      Get.to(() => const LoginScreen());
                    },
                    child: getCustomFont("Skip", 16.sp, Colors.white, 1,
                        fontWeight: FontWeight.w700),
                  ),
                ).paddingOnly(
                  top: 20.h,
                  right: 20.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _onPageViewChange(int page) {
    introController.onChange(page.obs);
  }
}
