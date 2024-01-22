import 'package:get/get.dart';

import '../controllers/update_a_product_controller.dart';

class UpdateAProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAProductController>(
      () => UpdateAProductController(),
    );
  }
}
