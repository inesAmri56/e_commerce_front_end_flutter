import 'package:ecommerce/screens/initialisation_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/button_widget.dart';
import 'login_screen.dart';

class VerifCode extends StatelessWidget {
  const VerifCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.purple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/forgot_pastel.png",
              width: MediaQuery.sizeOf(context).width*.4,
            ),
            SizedBox(height: 20,),
            Text("Enter Your Code",style: TextStyle(
              fontSize: 18,
            ),),
            SizedBox(height: 40,),
            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: "Code ",
                  labelStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Button(text: "Verify Code ",color: AppColors.green, onPressed:(){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InitialisationPassword()),
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
