import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../features/modules/auth/views/signup.dart';
import '../../../../widgets/button_widget.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.purple,
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            const Text("Let's get \n Started!",style: TextStyle(fontSize: 40,
                fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 50,),
            Image.asset('assets/welcome_screen_image.png',width: MediaQuery.sizeOf(context).width*.8,fit:BoxFit.fill ,),
            SizedBox(height: 100,),
            Button(text: "Sign Up", color: AppColors.green,onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpView()),
              );
            },),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const  Text("already have an account ?",style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,

                ),),
                SizedBox(width: 10,),
                Text("Log In", style: TextStyle( decoration: TextDecoration.underline,color: AppColors.green,fontWeight: FontWeight.bold,fontSize: 20),)
              ],

            )

          ],
        ),
      ),
    );
  }
}
