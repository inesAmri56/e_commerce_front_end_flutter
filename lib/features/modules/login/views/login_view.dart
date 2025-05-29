import 'package:ecommerce/features/modules/auth/views/forgot_password.dart';
import 'package:ecommerce/features/modules/auth/views/signup.dart';
import 'package:ecommerce/features/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/button_widget.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginController controller = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.purple,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 45),
                child: Image.asset(
                  'assets/welcome_screen_image.png',
                  width: MediaQuery.sizeOf(context).width * 0.6,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controller.userNameController,
                          validator: (value) =>
                          value == null || value.isEmpty ? "Username is required" : null,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.passwordController,
                          obscureText: true,
                          validator: (value) =>
                          value == null || value.isEmpty ? "Password is required" : null,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: const Icon(Icons.visibility),
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ForgotPassWordView());
                              },
                              child: const Text("Forgot Password?"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Obx(() {
                          return controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : Button(
                            text: "Log In",
                            color: AppColors.green,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 30),
                        const Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset("assets/google.png", width: 50),
                            Image.asset("assets/fb.png", width: 50),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => SignUpView());
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: AppColors.green,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
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
