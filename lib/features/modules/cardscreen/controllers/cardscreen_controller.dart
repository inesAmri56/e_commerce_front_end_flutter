
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardscreenController extends GetxController {
  RxList<Map<String, dynamic>> items = [
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 130.0,
      "description": "This high-quality product combines style and functionality...",
      "stock": 40,
      "count": 0
    },
    {
      "name": "Bag",
      "image": "assets/bags.png",
      "price": 140.0,
      "description": "This high-quality product combines style and functionality...",
      "stock": 14,
      "count": 0
    },
    {
      "name": "Shoes",
      "image": "assets/shoes.png",
      "price": 140.0,
      "description": "This high-quality product combines style and functionality...",
      "stock": 5,
      "count": 0
    },
  ].obs;

  int get totalItemCount =>
      items.fold(0, (sum, item) => sum + (item['count'] as int));

  double get totalPrice => items.fold(
      0.0,
          (sum, item) =>
      sum + (item['count'] as int) * (item['price'] as double));

  void increaseCount(int index) {
    if (items[index]['count'] < items[index]['stock']) {
      items[index]['count']++;
      items.refresh();
    } else {
      Get.defaultDialog(
        title: "You're out of stock",
        content: const Icon(Icons.error, color: Colors.red),
      );
    }
  }

  void decreaseCount(int index) {
    if (items[index]['count'] > 0) {
      items[index]['count']--;
      items.refresh();
    } else {
      Get.defaultDialog(
        title: "Remove Product?",
        content: const Text("Would you like to remove this product?"),
        textCancel: "No",
        textConfirm: "Remove",
        onConfirm: () {
          items.removeAt(index);
          Get.back();
        },
      );
    }
  }
}
