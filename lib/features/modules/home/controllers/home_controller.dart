import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<Map<String, dynamic>> items = [
    {"name": "Swatch", "image": "assets/swatch.png","price":130.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Bag", "image": "assets/bags.png","price":140.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Swatch", "image": "assets/swatch.png","price":140.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Shoes", "image": "assets/shoes.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Bag", "image": "assets/bags.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "T-shirt", "image": "assets/tshirt-.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
  ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
