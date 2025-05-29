import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final List<String> languages = ['English', 'Français', 'العربية'];
  var selectedLanguage = 'English';

  final List<String> paymentMethods = [
    'Credit Card',
    'PayPal',
    'Cash',
    'Bank Transfer',
  ];
  final RxString selectedPaymentMethod = ''.obs;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final RxBool passwordVisible = false.obs;
  final RxBool confirmPasswordVisible = false.obs;

  final Rx<File?> selectedImage = Rx<File?>(null);

  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    confirmPasswordVisible.value = !confirmPasswordVisible.value;
  }

  void updateSelectedPaymentMethod(String? value) {
    if (value != null) {
      selectedPaymentMethod.value = value;
    }
  }

  void selectLanguage(String? newValue) {
    if (newValue != null) {
      selectedLanguage = newValue;
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    }
  }

  void updateProfile() {
    print("Profile updated");
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
