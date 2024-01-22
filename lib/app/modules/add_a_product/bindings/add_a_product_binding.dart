import 'package:get/get.dart';

import '../controllers/add_a_product_controller.dart';

class AddAProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddAProductController>(
      () => AddAProductController(),
    );
  }
}
