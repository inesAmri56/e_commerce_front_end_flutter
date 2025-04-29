import 'package:ecommerce/constants/app_colors.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/verif_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/button_widget.dart';

class ForgotPassWord extends StatelessWidget {
  const ForgotPassWord({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: AppColors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/forgot_pastel.png",
              width: MediaQuery.sizeOf(context).width*.4,
            ),
            SizedBox(
              height: 30,
            ),
            Text("Forgot Password",style: TextStyle(
              fontSize: 18,
            ),),
            SizedBox(height: 40,),
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                validator: (value) {
                  // Validation de l'email avec RegExp
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "Email Address",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
           SizedBox(height: 30,),
           Button(text: "Submit",color: AppColors.green, onPressed:(){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => VerifCode()),
             );
           },),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Back to Login "),
            )
          ],
        ),
      ),
    );
  }
}
