import 'package:get/get.dart';

class PaymentmethodController extends GetxController {
  final List<Map<String, String>> paymentMethods = [
  {
  'name': 'Credit Card',
  'image': 'assets/credit-.png',
  },
  {
  'name': 'PayPal',
  'image': 'assets/paypal-.png',
  },
  {
  'name': 'Cash',
  'image': 'assets/cash-.png',
  },
  {
  'name': 'Bank Transfer',
  'image': 'assets/banKtransfer-.png',
  },
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
