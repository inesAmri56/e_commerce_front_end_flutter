import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/screens/editprofilescreen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showDropdownDialog({
    required BuildContext context,
    required String title,
    required List<String> options,
    required Function(String) onSelected,
  }) {
    String? selectedOption;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButton<String>(
                isExpanded: true,
                value: selectedOption,
                hint: const Text("Select an option"),
                items: options.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value;
                  });
                },
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (selectedOption != null) {
                  onSelected(selectedOption!);
                }
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> paymentMethods = ['Credit Card', 'PayPal', 'Cash'];
    final List<String> languages = ['English', 'Français', 'العربية'];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Image
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar.jpg'),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
              )
            ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen()));
                }),
                profileMenuItem(Icons.payment, "Payment Method", () {
                  _showDropdownDialog(
                    context: context,
                    title: "Select Payment Method",
                    options: paymentMethods,
                    onSelected: (method) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Payment Method: $method')),
                      );
                    },
                  );
                }),
                profileMenuItem(Icons.language, "Language", () {
                  _showDropdownDialog(
                    context: context,
                    title: "Select Language",
                    options: languages,
                    onSelected: (lang) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Language: $lang')),
                      );
                    },
                  );
                }),
                profileMenuItem(Icons.history, "Order History", () {}),
                const SizedBox(height: 10),
                profileMenuItem(Icons.logout, "Logout", () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                }, iconColor: AppColors.green),
              ],
            ),
          )
        ],
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
