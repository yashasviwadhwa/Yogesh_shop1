import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/gap.dart';
import '../../../widgets/text_design.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.colorWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: ListView(
        children: [
          VerticalGap(
            gap: 30.h,
          ),
          Center(
            child: TextDesign(
              text: AppString.signIn.toUpperCase(),
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          VerticalGap(
            gap: 50.h,
          ),

          ///Email Text Field
          TextField(
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
          VerticalGap(
            gap: 20.h,
          ),

          ///Password Text Field
          TextField(
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
          VerticalGap(
            gap: 15.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                AppString.forgetPassword,
                style: GoogleFonts.lato(
                  decoration: TextDecoration.underline,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.colorText,
                ),
              ),
            ),
          ),
          VerticalGap(
            gap: 30.h,
          ),

          ///Sign In Button
          SizedBox(
            width: double.infinity,
            height: 55.h,
            child: CustomElevatedButton(
              onTab: () => controller.onTapSignIn(),
              borderRadius: 10,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              text: AppString.signIn,
              textColor: AppColor.colorWhite,
            ),
          ),
          const Spacer(),
          _socialLogin(),
        ],
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
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.google),
              onPressed: () => controller.signInWithGoogle()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorLoginBackground,
      body: _ui(),
    );
  }
}
