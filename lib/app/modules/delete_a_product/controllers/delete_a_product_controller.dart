import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/api_client.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';

class DeleteAProductController extends GetxController {

  late TextEditingController productIDController;
  final _apiHelper = Get.find<ApiClient>();

  @override
  void onInit() {
    super.onInit();
    productIDController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    productIDController.dispose();
  }

  void onSubmit() {
    if(productIDController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterProductID,
        backgroundColor: AppColor.colorCECECE,
      );
    } else {
      deleteProduct();
    }
  }

  Future deleteProduct() async {
    final response = await _apiHelper.productDelete(productIDController.text);

    if (response != null) {
      Get.snackbar(
        'Success!',
        'Product delete successfully',
        backgroundColor: AppColor.colorCECECE,
      );
    } else {
      Get.snackbar("Eror Occured", "Error happened");
    }

  }

}
