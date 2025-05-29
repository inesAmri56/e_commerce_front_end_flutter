import 'package:ecommerce/features/modules/login/views/login_view.dart';
import 'package:ecommerce/features/modules/paymentmethod/views/paymentmethod_view.dart';
import 'package:ecommerce/features/modules/profile/views/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
   ProfileView({Key? key}) : super(key: key);
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.green,
        foregroundColor: Colors.black,
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        color: AppColors.purple,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            const SizedBox(height: 12),
            const Text("Ines El Amri", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("inesamri@gmail.com", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  profileMenuItem(Icons.person, "Edit Profile", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditProfileView()));
                  }),
                  profileMenuItem(Icons.payment, "Payment Method", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>  PaymentmethodView()));
                  }),
                  Card(
                    elevation: 1,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text('Language', style: TextStyle(fontSize: 16)),
                      trailing: DropdownButton<String>(
                        value: controller.selectedLanguage,
                        underline: const SizedBox(),
                        onChanged: (String? newValue) {
                          controller.selectedLanguage;
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Language changed to: $newValue')),
                            );

                        },
                        items: controller.languages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  profileMenuItem(Icons.history, "Order History", () {}),
                  const SizedBox(height: 10),
                  profileMenuItem(Icons.logout, "Logout", () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (_) =>  LoginView()));
                  }, iconColor: AppColors.green),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget profileMenuItem(IconData icon, String title, VoidCallback onTap, {Color iconColor = Colors.black}) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: const TextStyle(fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
