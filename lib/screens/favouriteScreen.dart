import 'package:ecommerce/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/buildfavorite_item.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> favorites = [
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 130.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Bag",
      "image": "assets/bags.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
    {
      "name": "Shoes",
      "image": "assets/shoes.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: AppColors.green,
        foregroundColor: AppColors.purple,
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  color: AppColors.purple,
                  size: 30,
                ),
              ),
              if (favorites.isNotEmpty)
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    child: Text(
                      '${favorites.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return buildFavouriteItem(
            image: item['image'],
            title: item['name'],
            price: item['price'],
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
      ),
    );
  }
}
