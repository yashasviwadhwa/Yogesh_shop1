import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.color0E101B.withOpacity(0.7),
              AppColor.color0E101B.withOpacity(0.6),
              AppColor.color262c44.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        alignment: Alignment.center,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Obx(() {
            return Image.asset(
              controller.image.toString(),
              width: Get.width * 0.4,
              height: Get.width * 0.4,
            );
          }),
        ),
      ),
    );
  }
}
