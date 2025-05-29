import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../controllers/paymentmethod_controller.dart';
class PaymentmethodView extends GetView<PaymentmethodController> {
   PaymentmethodView({Key? key}) : super(key: key);
  PaymentmethodController controller = Get.put(PaymentmethodController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: const Text(
          "Payment Methods",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: AppColors.green.withOpacity(0.1),
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: controller.paymentMethods.length,
          itemBuilder: (context, index) {
            final method = controller.paymentMethods[index];
            return Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: Image.asset(
                  method['image']!,
                  width: 40,
                  height: 40,
                ),
                title: Text(
                  method['name']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Handle selection
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
