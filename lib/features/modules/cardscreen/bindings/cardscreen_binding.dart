import 'package:get/get.dart';

import '../controllers/cardscreen_controller.dart';

class CardscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardscreenController>(
      () => CardscreenController(),
    );
  }
}
