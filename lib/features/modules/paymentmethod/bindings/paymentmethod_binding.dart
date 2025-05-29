import 'package:get/get.dart';

import '../controllers/paymentmethod_controller.dart';

class PaymentmethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentmethodController>(
      () => PaymentmethodController(),
    );
  }
}
