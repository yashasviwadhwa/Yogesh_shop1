import 'dart:developer';

import 'package:e_shop/app/local_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../model/product_list_model.dart';
import '../../../network/api_client.dart';

class ProductDetailController extends GetxController {
  RxString name = ''.obs;
  RxInt id = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isAddToCart = true.obs;
  final _apiHelper = Get.find<ApiClient>();
  Rx<Product> product = Product().obs;
  late Razorpay _razorpay;

  @override
  void onInit() {
    name.value = Get.arguments['productName'];
    id.value = Get.arguments['productId'];
    getProduct();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_O7gflPF1bJcbYC',
      'amount': 100,
      'name': 'E-Shop',
      'description': 'Online Shopping Platform',
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      // 'external': {
      //   'wallets': ['paytm', 'phonepe']
      // }
    };

    try { 
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('Success Response: $response');
    Get.back();
    Get.snackbar("SUCCESS", response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('Error Response: $response');
    Get.snackbar(
      "ERROR",
      "${response.code} - ${response.message!}",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('External SDK Response: $response');
    Get.snackbar(
      "EXTERNAL_WALLET",
      response.walletName!,
    );
  }

  Future getProduct() async {
    isLoading.value = true;
    final response = await _apiHelper.product(id.value);

    if (response != null) {
      final data = Product.fromJson(response.data);
      product.value = data;
    } else {
      Get.snackbar("Eror Occured", "Error happened");
    }
    isLoading.value = false;
  }

  void addToCart() {
    SecureStorage.cartCalculator(isAddToCart.value);
    isAddToCart.value = !isAddToCart.value;
  }
}
