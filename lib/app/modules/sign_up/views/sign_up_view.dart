import 'package:e_shop/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:e_shop/app/utils/app_color.dart';
import 'package:e_shop/app/utils/app_string.dart';
import 'package:e_shop/app/widgets/custom_elevated_button.dart';
import 'package:e_shop/app/widgets/gap.dart';
import 'package:e_shop/app/widgets/text_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  Widget _ui() {
    return Stack(
      children: [
        _firstContainerForBackground(),
        _secondContainerForLoginDetail(),
      ],
    );
  }

  Widget _firstContainerForBackground() {
    return Container(
      width: double.infinity,
      height: 500.h,
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
    );
  }

  Widget _secondContainerForLoginDetail() {
    return Container(
      margin: EdgeInsets.only(
        top: 150.h,
        left: 30.w,
        right: 30.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            VerticalGap(gap: 15.h),
            Center(
              child: TextDesign(
                text: AppString.signUp.toUpperCase(),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            VerticalGap(gap: 50.h),
            // Name TextField
            TextField(
              controller: controller.nameController,
              style: GoogleFonts.lato(
                color: AppColor.colorText,
              ),
              cursorColor: AppColor.color262c44,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                hintText: AppString.name,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            VerticalGap(gap: 20.h),

            // Email TextField
            TextField(
              controller: controller.emailController,
              style: GoogleFonts.lato(
                color: AppColor.colorText,
              ),
              cursorColor: AppColor.color262c44,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                hintText: AppString.email,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            VerticalGap(gap: 20.h),

            // Password TextField
            TextField(
              controller: controller.passwordController,
              style: GoogleFonts.lato(
                color: AppColor.colorText,
              ),
              cursorColor: AppColor.color262c44,
              obscureText: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                hintText: AppString.password,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColor.color262c44,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ),
            ),
            VerticalGap(gap: 15.h),
            // ... existing widgets
            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: CustomElevatedButton(
                onTab: () => controller.onTapSignUp(),
                borderRadius: 10,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                text: AppString.signUp,
                textColor: AppColor.colorWhite,
              ),
            ),
            const Spacer(),
            _socialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _socialLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30.h,
      ),
      child: Column(
        children: [
          TextDesign(
            text: AppString.orContinueWith,
          ),
          VerticalGap(),
          // IconButton with Google icon, onPressed is null
          const IconButton(
            icon: FaIcon(FontAwesomeIcons.google),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
        controller.onBackPressed();
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColor.colorLoginBackground,
        body: _ui(),
      ),
    );
  }
}
