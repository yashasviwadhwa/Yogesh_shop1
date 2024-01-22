import 'package:e_shop/app/routes/app_pages.dart';
import 'package:e_shop/app/utils/app_color.dart';
import 'package:e_shop/app/utils/app_string.dart';
import 'package:e_shop/app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences _preferences;
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;

  @override
  void onInit() {
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  void onTapSignIn() {
    Get.offNamed(Routes.HOME);
  }

  void onTapSignUp() async {
    if (formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await FirebaseAuth.instance.currentUser?.updateDisplayName(
          nameController.text.trim(),
        );

        showSuccessBottomSheet('Account created successfully!');
      } catch (e) {
        showErrorBottomSheet(e.toString());
      }
    }
  }

  void showErrorBottomSheet(String errorMessage) {
    Get.snackbar("Error", "Something Went Wrong Please Try Again");
  }

  void showSuccessBottomSheet(String message) {
    Get.snackbar("Success", "You'r Account has Succesfully Created");

    onTapSignIn();
  }

  void onBackPressed() {
    Get.defaultDialog(
      title: AppString.exit,
      barrierDismissible: false,
      titleStyle: GoogleFonts.poppins(
        color: AppColor.color262c44,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
      ),
      onCancel: () => Get.back(),
      cancel: CustomElevatedButton(
        onTab: () => Get.back(),
        text: AppString.no,
        textColor: AppColor.colorWhite,
      ),
      confirm: CustomElevatedButton(
        onTab: () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        },
        text: AppString.yes,
        textColor: AppColor.colorWhite,
      ),
    );
  }
}
