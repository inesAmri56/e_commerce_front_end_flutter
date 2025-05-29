import 'package:get/get.dart';

class FavoritesController extends GetxController {

  final List<Map<String, dynamic>> favorites = [
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 130.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Bag",
      "image": "assets/bags.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Shoes",
      "image": "assets/shoes.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
  ];

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


}
