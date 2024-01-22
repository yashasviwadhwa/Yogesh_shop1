import 'package:get/get.dart';

import '../controllers/delete_a_product_controller.dart';

class DeleteAProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeleteAProductController>(
      () => DeleteAProductController(),
    );
  }
}
