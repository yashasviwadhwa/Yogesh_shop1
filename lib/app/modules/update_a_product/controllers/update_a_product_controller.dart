import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/product_list_model.dart';
import '../../../network/api_client.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_string.dart';

class UpdateAProductController extends GetxController {
  late TextEditingController pNameController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController brandController;
  late TextEditingController categoryController;
  late TextEditingController ratingController;
  late TextEditingController stockController;
  RxBool isLoading = false.obs;
  final _apiHelper = Get.find<ApiClient>();
  Rx<Product> product = Product().obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
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
      updateProduct();
    }
  }

  Future getProduct() async {
    isLoading.value = true;
    final response = await _apiHelper.product('1');

    if (response != null) {
      final data = Product.fromJson(response.data);
      product.value = data;
      pNameController.text = product.value.title ?? '';
      descriptionController.text = product.value.description ?? '';
      priceController.text = product.value.price.toString();
      discountController.text = product.value.discountPercentage.toString();
      brandController.text = product.value.brand ?? '';
      categoryController.text = product.value.category ?? '';
      ratingController.text = product.value.rating.toString();
      stockController.text = product.value.stock.toString();
    } else {
      Get.snackbar("Eror Occured", "Error happened");
    }
    isLoading.value = false;
  }

  Future updateProduct() async {
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

    final response = await _apiHelper.productUpdate('1', map);

    if (response != null) {
      Get.snackbar(
        'Success!',
        'Product update successfully',
        backgroundColor: AppColor.colorCECECE,
      );
    } else {
      Get.snackbar("Error Occured", "Error happened");
    }
  }
}
