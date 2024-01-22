import 'package:e_shop/app/utils/app_color.dart';
import 'package:e_shop/app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../network/api_client.dart';

class AddAProductController extends GetxController {
  late TextEditingController pNameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController brandController;
  late TextEditingController categoryController;
  late TextEditingController ratingController;
  late TextEditingController stockController;
  final _apiHelper = Get.find<ApiClient>();

  @override
  void onInit() {
    super.onInit();
    pNameController = TextEditingController();
    descriptionController = TextEditingController();
    priceController = TextEditingController();
    discountController = TextEditingController();
    brandController = TextEditingController();
    categoryController = TextEditingController();
    ratingController = TextEditingController();
    stockController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    pNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    discountController.dispose();
    brandController.dispose();
    categoryController.dispose();
    ratingController.dispose();
    stockController.dispose();
  }

  void onSubmit() {
    if (pNameController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterProductName,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (descriptionController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterDescription,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (priceController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterPrice,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (discountController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterPercentageDiscount,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (brandController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterBrand,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (categoryController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterCategory,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (ratingController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterRatings,
        backgroundColor: AppColor.colorCECECE,
      );
    } else if (stockController.text.trim().isEmpty) {
      Get.snackbar(
        AppString.error,
        AppString.pleaseEnterStock,
        backgroundColor: AppColor.colorCECECE,
      );
    } else {
      addProduct();
    }
  }

  Future addProduct() async {
    final map = {
      "title": pNameController.text,
      "description": descriptionController.text,
      "price": priceController.text,
      "discountPercentage": discountController.text,
      "rating": ratingController.text,
      "stock": stockController.text,
      "brand": brandController.text,
      "category": categoryController.text,
    };

    final response = await _apiHelper.productAdd(map);

    if (response != null) {
      Get.snackbar(
        'Success!',
        'Product added successfully',
        backgroundColor: AppColor.colorCECECE,
      );
    } else {
      Get.snackbar("Eror Occured", "Error happened");
    }
  }

}
