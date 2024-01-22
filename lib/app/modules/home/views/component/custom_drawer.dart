import 'package:e_shop/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_image.dart';
import '../../../../utils/app_string.dart';
import '../../../../widgets/gap.dart';
import '../../../../widgets/text_design.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  final controller = Get.put(HomeController());

  Widget drawerName(String name) {
    return GestureDetector(
        onTap: () {
          controller.navigate(name);
        },
        child: TextDesign(
          text: name,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            AppImage.logo,
            width: double.infinity,
            height: 250.h,
            fit: BoxFit.fill,
          ),
          VerticalGap(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                drawerName(AppString.addAProduct),
                VerticalGap(
                  gap: 20,
                ),
                drawerName(
                  AppString.updateAProduct,
                ),
                VerticalGap(
                  gap: 20,
                ),
                drawerName(
                  AppString.deleteAProduct,
                ),
                VerticalGap(
                  gap: 20,
                ),
                drawerName(
                  AppString.signOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // void showExitConfirmationDialog() {
  //   Get.defaultDialog(
  //     title: AppString.exit,
  //     barrierDismissible: false,
  //     titleStyle: GoogleFonts.poppins(
  //       color: AppColor.color262c44,
  //       fontWeight: FontWeight.w600,
  //       fontSize: 24.sp,
  //     ),
  //     onCancel: () => Get.back(),
  //     cancel: CustomElevatedButton(
  //       onTab: () => Get.back(),
  //       text: AppString.no,
  //       textColor: AppColor.colorWhite,
  //     ),
  //     confirm: CustomElevatedButton(
  //       onTab: () {
  //         SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //       },
  //       text: AppString.yes,
  //       textColor: AppColor.colorWhite,
  //     ),
  //   );
  // }
}
