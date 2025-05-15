
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/gradientbutton.dart';

class EditProfileScreen extends StatefulWidget {
const EditProfileScreen({super.key});

@override
State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
final List<String> _paymentMethods = [
'Credit Card',
'PayPal',
'Cash',
'Bank Transfer',
];

String? _selectedPaymentMethod;
final _formKey = GlobalKey<FormState>();

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController _confirmPasswordController = TextEditingController();
final TextEditingController _paymentMethodController = TextEditingController();

bool _passwordVisible = false;
bool _confirmPasswordVisible = false;

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
padding: const EdgeInsets.all(20.0),
child: Form(
key: _formKey,
child: Column(
children: [
TextFormField(
controller: _emailController,
decoration:  InputDecoration(
filled: true,
fillColor: Colors.grey[200],
labelText: "Email",
labelStyle: TextStyle(color: Colors.grey),
prefixIcon: Icon(Icons.email),
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none
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

// New Password
TextFormField(
controller: _passwordController,
obscureText: !_passwordVisible,
decoration: InputDecoration(
filled: true,
fillColor: Colors.grey[200],
labelText: "New Password",
labelStyle: const TextStyle(color: Colors.grey),
prefixIcon: const Icon(Icons.lock),
suffixIcon: IconButton(
icon: Icon(
_passwordVisible ? Icons.visibility : Icons.visibility_off,
),
onPressed: () {
setState(() {
_passwordVisible = !_passwordVisible;
});
},
),
border:  OutlineInputBorder(
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
),
const SizedBox(height: 20),

// Confirm Password
TextFormField(
controller: _confirmPasswordController,
obscureText: !_confirmPasswordVisible,
decoration: InputDecoration(
filled: true,
fillColor: Colors.grey[200],
labelText: "Confirm Password",
labelStyle: const TextStyle(color: Colors.grey),
prefixIcon: const Icon(Icons.lock_outline),
suffixIcon: IconButton(
icon: Icon(
_confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
),
onPressed: () {
setState(() {
_confirmPasswordVisible = !_confirmPasswordVisible;
});
},
),
border:  OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
),
validator: (value) {
if (value != _passwordController.text) {
return 'Passwords do not match';
}
return null;
},
),
const SizedBox(height: 20),
DropdownButtonFormField<String>(
value: _selectedPaymentMethod,
decoration:  InputDecoration(
labelText: "Payment Method",
labelStyle: TextStyle(color: Colors.grey),
prefixIcon: Icon(Icons.payment),
filled: true,
fillColor: Colors.grey[200],
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(10),
borderSide: BorderSide.none,
),
),
items: _paymentMethods.map((method) {
return DropdownMenuItem(
value: method,
child: Text(method),
);
}).toList(),
onChanged: (value) {
setState(() {
_selectedPaymentMethod = value;
});
},
validator: (value) {
if (value == null || value.isEmpty) {
return 'Please select a payment method';
}
return null;
},
),
const SizedBox(height: 30),
GradientButton(
text: "Update",
onPressed: () {
if (_formKey.currentState!.validate()) {
ScaffoldMessenger.of(context).showSnackBar(
const SnackBar(content: Text('Updated')),
);
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