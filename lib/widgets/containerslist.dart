import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerList extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const ContainerList({required this.name, required this.image, Key? key,
    required this.price,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey
      ),
      width: 120,
      child: Column(
        mainAxisSize:MainAxisSize.min ,
        children: [
          Image.asset(image, height: 80),
          SizedBox(height: 10),
          Text(name, style: TextStyle(color: Colors.black87)),
          Text("\$"+"$price")
        ],


      ),
    );
  }
}
