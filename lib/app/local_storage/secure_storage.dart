import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

RxString cartCount = '0'.obs;

class SecureStorage {

  static cartCalculator(bool isAdd) {

    if(cartCount.value == '9' || cartCount.value == '9+') {
      cartCount.value = '9+';
    } else if(isAdd){
      cartCount.value = (int.parse(cartCount.value) + 1).toString();
    } else {
      cartCount.value = (int.parse(cartCount.value) - 1).toString();
    }

  }


}