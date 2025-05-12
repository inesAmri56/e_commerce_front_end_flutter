import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});
List favourites=[
  {"name": "Swatch", "image": "assets/swatch.png","price":130.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
  {"name": "Bag", "image": "assets/bags.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
  {"name": "Swatch", "image": "assets/swatch.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
  {"name": "Shoes", "image": "assets/shoes.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(

     itemCount: favourites.length,
          itemBuilder: (context, index) {
    final favorites = favourites[index];
    return Padding(
    padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Text.rich(
          //
            TextSpan(
              children: [
                TextSpan( text: "${favorites["name"]}",),
                TextSpan(text:" "),
                TextSpan( text: "\$${favorites["price"]}",
                    style: TextStyle(color: AppColors.green)),
              ]
            )
          ),
          SizedBox(width: 90,),
          Image.asset( favorites["image"],height: 100 ,),
        ],
      )
    );
    },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
        childAspectRatio: 1,mainAxisSpacing: 1,crossAxisSpacing: 2),);
    }
}
