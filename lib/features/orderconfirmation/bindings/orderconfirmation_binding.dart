import 'package:get/get.dart';

import '../controllers/orderconfirmation_controller.dart';

class OrderconfirmationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderconfirmationController>(
      () => OrderconfirmationController(),
    );
  }
}
