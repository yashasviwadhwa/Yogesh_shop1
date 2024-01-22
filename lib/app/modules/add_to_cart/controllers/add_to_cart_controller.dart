import 'dart:developer';
import 'package:e_shop/app/model/add_to_cart_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../network/api_client.dart';
class AddToCartController extends GetxController {
  final _apiHelper = Get.find<ApiClient>();
  RxList<Cart> cartList = <Cart>[].obs;
  RxBool isLoading = false.obs;
  late Razorpay _razorpay;

  @override
  void onInit() {
    getAddToCartList();
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
         "EXTERNAL_WALLET", response.walletName!,
      );
  }

  Future getAddToCartList() async {
    isLoading.value = true;
    final response = await _apiHelper.addToCartList();
    if (response != null) {
      final data = AddToCartResponseModel.fromJson(response.data);
      log("message: $data");
      cartList.value = data.carts ?? [];
      isLoading.value = false;
    } else {
      isLoading.value = false;
      Get.snackbar("Eror Occured", "Error happened");
    }
  }
}
