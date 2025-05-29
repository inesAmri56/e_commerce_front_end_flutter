import 'package:ecommerce/features/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../widgets/buildfavorite_item.dart';
import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
   FavoritesView({Key? key}) : super(key: key);
  FavoritesController controller = Get.put(FavoritesController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                if (controller.favorites.isNotEmpty)
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
                        minWidth: 10,
                        minHeight: 20,
                      ),
                      child: Text(
                        '${controller.favorites.length}',
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
        body: ListView.builder(
          itemCount:controller.favorites.length,
          itemBuilder: (context, index) {
            final item =controller.favorites[index];
            return buildFavouriteItem(
              image: item['image'],
              title: item['name'],
              price: item['price'],
            );
          },

        ));
  }
}
