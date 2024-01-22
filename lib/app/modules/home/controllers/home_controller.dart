import 'package:e_shop/app/routes/app_pages.dart';
import 'package:e_shop/app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/product_list_model.dart';
import '../../../network/api_client.dart';

class HomeController extends GetxController {
  final _apiHelper = Get.find<ApiClient>();
  RxList<Product>? products = <Product>[].obs;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences _preferences;

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }

  void navigate(String routeName, {int? index}) {
    switch (routeName) {
      case AppString.addAProduct:
        Get.back();
        Get.toNamed(Routes.ADD_A_PRODUCT);
        break;
      case AppString.updateAProduct:
        Get.back();
        Get.toNamed(Routes.UPDATE_A_PRODUCT);
        break;
      case AppString.deleteAProduct:
        Get.back();
        Get.toNamed(Routes.DELETE_A_PRODUCT);
        break;
      case AppString.signOut:
        signOut();
        break;
      case AppString.productDetail:
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: {
          'productName': products?[index!].title,
          'productId': products?[index!].id,
        });
      default:
        Get.back();
    }
  }

  Future<void> signOut() async {
    await Get.defaultDialog<bool>(
      title: 'Sign Out',
      content: const Text('Are you sure you want to sign out?'),
      textConfirm: 'Yes',
      textCancel: 'No',
      onConfirm: () async {
        _preferences = await SharedPreferences.getInstance();
        _preferences.clear();
        await googleSignIn.signOut();

        // Navigate to the login screen
        Get.offAllNamed(Routes.LOGIN);
      },
      onCancel: () => Get.back(),
    );
  }

  Future getProductList() async {
    final response = await _apiHelper.productList();

    if (response != null) {
      final data = ProductListModel.fromJson(response.data);
      products?.value = data.products ?? [];
    } else {
      Get.snackbar("Eror Occured", "Error happened");
    }
  }
}
