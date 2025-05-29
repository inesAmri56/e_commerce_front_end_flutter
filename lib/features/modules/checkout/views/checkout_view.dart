import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        title: const Text("Order Confirmation"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSectionCard(
              title: "Shipping Details",
              child: ListTile(
                title: Text(controller.shippingDetails["name"]),
                subtitle: Text(
                    "${controller.shippingDetails["address"]} / ${controller.shippingDetails["phone"]}"),
                trailing: _editButton(),
              ),
            ),
            const SizedBox(height: 16),

            _buildSectionCard(
              title: "Payment Method",
              child: ListTile(
                leading: Image.asset("assets/mastercard-.png", width: 40),
                title: Text(controller.paymentMethod["number"]),
                subtitle: Text(controller.paymentMethod["type"]),
                trailing: _editButton(),
              ),
            ),
            const SizedBox(height: 16),

            _buildSectionCard(
              title: "Products",
              child: Column(
                children: controller.items.map((item) {
                  return ListTile(
                    leading: Image.asset(item["image"], width: 50, height: 50),
                    title: Text(item["name"],
                        style: const TextStyle(color: Colors.green)),
                    subtitle:
                    Text("\$ ${item["price"].toStringAsFixed(2)}"),
                    trailing: Text("${item["count"]}x"),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total",
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(" \$ ${controller.getTotal().toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding:
                const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              ),
              onPressed: () {
                // Remplace ceci par ta vraie vue de confirmation
                Get.snackbar("Order", "Order confirmed!");
              },
              child: const Text("Confirm Order",
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }

  Widget _editButton() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: AppColors.green,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: const Text(
        "Edit",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
