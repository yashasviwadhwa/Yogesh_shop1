import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreenController extends GetxController {
  //TODO: Implement CheckoutScreenController
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController Address = TextEditingController();
  final TextEditingController Country = TextEditingController();
  final TextEditingController ZipCode = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
