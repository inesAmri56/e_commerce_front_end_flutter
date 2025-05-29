
import 'package:ecommerce/features/orderconfirmation/views/orderconfirmation_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/circularbutton.dart';
import '../../../routes/app_pages.dart';
import '../../checkout/views/checkout_view.dart';
import '../controllers/cardscreen_controller.dart';

class CardscreenView extends GetView<CardscreenController> {
  CardscreenView({Key? key}) : super(key: key);
  CardscreenController controller = Get.put(CardscreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        title: const Text("Card"),
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.purple,
        centerTitle: true,
        actions: [
          Obx(() => Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart,
                    color: AppColors.purple, size: 30),
              ),
              if (controller.totalItemCount > 0)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints:
                    const BoxConstraints(minWidth: 20, minHeight: 20),
                    child: Text(
                      '${controller.totalItemCount}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          )),
        ],
      ),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(item["image"],
                          height: 80, width: 80, fit: BoxFit.contain),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(item["name"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            const SizedBox(height: 8),
                            Text("\$${item["price"]}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          BuildCircleButton("-", () {
                            controller.decreaseCount(index);
                          }),
                          const SizedBox(width: 10),
                          Text("${item["count"]}",
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 10),
                          BuildCircleButton("+", () {
                            controller.increaseCount(index);
                          }),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    Text('\$${controller.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child:ElevatedButton.icon(
                    onPressed: controller.totalItemCount == 0
                        ? null
                        : () {
                      Get.snackbar("Checkout", "Proceeding...");
                      Get.toNamed(Routes.ORDERCONFIRMATION);  // Use named route here
                    },
                    icon: Image.asset("assets/cardsh-.png", height: 24, width: 50),
                    label: const Text("Checkout",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      backgroundColor: AppColors.green,
                      foregroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
