import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final Map<String, dynamic> shippingDetails = {
    "name": "Inesss el Amri",
    "address": "Tunis/sfax",
    "phone": "+216 56895478"
  };

  final Map<String, dynamic> paymentMethod = {
    "type": "Master Card",
    "number": "•••• 980"
  };

  final List<Map<String, dynamic>> items = [
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 130.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "count": 1
    },
    {
      "name": "Bag",
      "image": "assets/bags.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "count": 1
    },
    {
      "name": "Shoes",
      "image": "assets/shoes.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "stock": 5,
      "count": 0
    },
  ];

  double getTotal() {
    return items.fold(
        0.0, (sum, item) => sum + (item["price"] * item["count"]));
  }

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
