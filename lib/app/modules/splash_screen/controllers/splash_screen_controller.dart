import 'dart:async';
import 'package:e_shop/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/app_image.dart';

class SplashScreenController extends GetxController {
  RxString image = ''.obs;
  late SharedPreferences _preferences;

  @override
  void onInit() {
    super.onInit();
    image.value = AppImage.logo;
    isLoginCheck();
  }

  void isLoginCheck() async {
    _preferences = await SharedPreferences.getInstance();
    String uID = _preferences.getString('uID') ?? '';
    Timer(
        const Duration(
          seconds: 3,
        ), () {
      uID.isEmpty
          ? Get.offAndToNamed(
              Routes.LOGIN,
            )
          : Get.offAndToNamed(
              Routes.HOME,
            );
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
