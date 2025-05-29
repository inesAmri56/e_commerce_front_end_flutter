import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/constants/app_colors.dart';
import '../../../widgets/appbuttom_navigationbar.dart';
import '../controllers/orderconfirmation_controller.dart';

class OrderconfirmationView extends GetView<OrderconfirmationController> {
  const OrderconfirmationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column
        (
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack
              (
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.grey,
                  ),
                ),

                Container(
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.green,
                  ),
                ),

                Icon(Icons.check)
              ],
            ),
          ),
          SizedBox(height: 200,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              padding:
              const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AppButtomNavigationBar(initialIndex: 0)),
                      (route) => false);
            },
            child: const Text("Continue Shopping",
                style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
        ],

      ),
    );
  }
}
