import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/gradientbutton.dart';

class EditProfileView extends GetView<ProfileController> {
   EditProfileView({super.key});
ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.green.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(() {
                        final image = controller.selectedImage.value;
                        return CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.purple,
                          child: ClipOval(
                            child: image != null
                                ? Image.file(
                              image,
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            )
                                : Image.asset(
                              'assets/avatar.jpg',
                              fit: BoxFit.cover,
                              width: 120,
                              height: 120,
                            ),
                          ),
                        );
                      }),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: controller.pickImage,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(
                              Icons.camera_alt,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Email",
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        Obx(() => TextFormField(
                          controller: controller.passwordController,
                          obscureText: !controller.passwordVisible.value,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(controller.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: controller.togglePasswordVisibility,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        )),
                        const SizedBox(height: 20),
                        Obx(() => TextFormField(
                          controller: controller.confirmPasswordController,
                          obscureText: !controller.confirmPasswordVisible.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            labelText: "Confirm Password",
                            labelStyle: const TextStyle(color: Colors.grey),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.confirmPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: controller.toggleConfirmPasswordVisibility,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value != controller.passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        )),
                        const SizedBox(height: 20),
                        // DropdownButtonFormField<String>(
                        //   value: controller.selectedPaymentMethod.value,
                        //   decoration: InputDecoration(
                        //     labelText: "Payment Method",
                        //     labelStyle: const TextStyle(color: Colors.grey),
                        //     prefixIcon: const Icon(Icons.payment),
                        //     filled: true,
                        //     fillColor: Colors.grey[200],
                        //     border: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10),
                        //       borderSide: BorderSide.none,
                        //     ),
                        //   ),
                        //   items: controller.paymentMethods.map((method) {
                        //     return DropdownMenuItem(
                        //       value: method,
                        //       child: Text(method),
                        //     );
                        //   }).toList(),
                        //   onChanged: (value) {
                        //     if (value != null) {
                        //       controller.updateSelectedPaymentMethod(value);
                        //     }
                        //   },
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return 'Please select a payment method';
                        //     }
                        //     return null;
                        //   },
                        // ),
                        const SizedBox(height: 30),
                        GradientButton(
                          text: "Update",
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.updateProfile();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Updated')),
                              );
                              Get.toNamed(Routes.PROFILE);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
