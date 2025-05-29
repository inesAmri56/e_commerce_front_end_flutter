
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

Widget buildFavouriteItem({
  required String image,
  required double price,
  required String title,
}) {
  return Padding(
    padding: const EdgeInsets.all(4),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
           Container(
             height: 40,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey[200],


             ),
             
             child: TextButton(onPressed: (){},
                 child: Text("Add To Card",style: TextStyle(
                   color: AppColors.green,))),
           )
        ],
      ),
    ),
  );
}
