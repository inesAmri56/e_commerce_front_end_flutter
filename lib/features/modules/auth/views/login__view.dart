import 'package:ecommerce/features/modules/auth/views/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/appbuttom_navigationbar.dart';
import '../../../../widgets/button_widget.dart';
import '../controllers/auth_controller.dart';
import 'forgot_password.dart';

class LoginView extends GetView<AuthController> {
   LoginView({Key? key}) : super(key: key);
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
                   child: Column(
                     children: [

                       TextFormField(
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: Colors.grey[200],
                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                           labelText: "UserName",
                           labelStyle: const TextStyle(color: Colors.grey),
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide.none
                           ),
                         ),
                       ),

                       const SizedBox(height: 20),
                       TextField(

                         obscureText: true,
                         decoration: InputDecoration(
                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                           filled: true,
                           fillColor: Colors.grey[200],

                           suffixIcon: const Icon(Icons.visibility),
                           labelText: "Password",
                           labelStyle: const TextStyle(color: Colors.grey),
                           border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(10),
                               borderSide: BorderSide.none
                           ),
                         ),
                       ),
                       SizedBox(height: 10,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           GestureDetector(
                               onTap: (){
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) =>ForgotPassWordView()),
                                 );
                               },
                               child:const Text("Forgot Password?"))
                         ],
                       ),
                       const SizedBox(height: 40),
                       Button(
                         text: "Log In ",
                         color: AppColors.green,
                         onPressed: () {
                           Navigator.pushAndRemoveUntil(
                               context,
                               MaterialPageRoute(
                                 builder: (_) => AppButtomNavigationBar(initialIndex:0),
                               ),
                                   (route)=>false);
                         },

                       ),
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
                             "Already have an account?",
                             style: TextStyle(
                               color: Colors.black,
                               fontSize: 16,
                             ),
                           ),
                           const SizedBox(width: 5),
                           GestureDetector(
                             onTap: () {
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => SignUpView()),
                               );
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
             ],
           ),
         ),
       ),
     );
   }



}