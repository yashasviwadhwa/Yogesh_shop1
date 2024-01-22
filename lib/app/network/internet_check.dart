import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';
class NetworkConnectivity extends GetConnect {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    /// Checks the initial connection status.
    _connectivity.checkConnectivity().then(_performActionOnConnectivityChange);

    /// Checks the ongoing connection status.
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      _performActionOnConnectivityChange,
    );
  }

  void _performActionOnConnectivityChange(ConnectivityResult result) async {
    if (result != ConnectivityResult.wifi &&
        result != ConnectivityResult.mobile) {
      //Get.toNamed(Routes.NO_INTERNET);
    }
    // else if ((result == ConnectivityResult.wifi ||
    //         result == ConnectivityResult.mobile) &&
    //     Get.currentRoute == Routes.NO_INTERNET) {
    //   Get.back();
    // }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
