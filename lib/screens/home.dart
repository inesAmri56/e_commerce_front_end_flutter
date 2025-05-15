import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/widgets/appbuttom_navigationbar.dart';

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/containerslist.dart';
import '../widgets/promo_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  HomeScreen({super.key});

  final List<Map<String, dynamic>> items = [
    {"name": "Swatch", "image": "assets/swatch.png","price":130.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Bag", "image": "assets/bags.png","price":140.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Swatch", "image": "assets/swatch.png","price":140.0,
      "description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Shoes", "image": "assets/shoes.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "Bag", "image": "assets/bags.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
    {"name": "T-shirt", "image": "assets/tshirt-.png","price":140.0,"description":"This high-quality product combines style and functionality,perfect for everyday use. Crafted with care to meet your expectations"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.purple,
        title: const  Text('Home'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.grid_view_rounded, color: AppColors.green),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const  Icon(Icons.shopping_cart, color: AppColors.green)),
          const CircleAvatar(backgroundImage: AssetImage("assets/avatar.jpg")),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: CircleAvatar(child: Image.asset("assets/avatar.jpg")),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AppButtomNavigationBar(initialIndex: 3)),
                        (route) => false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const  LoginScreen()),
                        (route) => false);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .70,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 150,
                child: PageView(
                  controller: _pageController,
                  children: [
                    promoCard("30% OFF", "assets/swatch.png"),
                    promoCard("50% OFF", "assets/shoes.png"),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 2,
                effect: WormEffect(
                  activeDotColor: AppColors.green,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
              SizedBox(height: 10),

              SizedBox(height: 30),
              Text("Recommended", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ContainerList(
                        name: item["name"] ?? "not found",
                        image: item["image"] ?? "image not found",
                        price: item["price"] ,


                      ),
                    );
                  },
                ),




    ),
    SizedBox(height: 20,),
              Text("Popular", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    SizedBox(height: 10,),
    SizedBox(
      height: 300,
      child: GridView.builder(
      itemCount: items.length,
      itemBuilder:(context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(child: Text(item["name"])),
                  backgroundColor: Colors.white,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(item["image"], height: 150),
                      SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Price: ",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        TextSpan(
                          text: "\$${item["price"]}",
                          style: TextStyle(color: Colors.green),
                        ),

                      ],
                    ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("${item["description"]}",
                            style: TextStyle(
                              color: Colors.black,
                            ),

                                                 ),
                         )
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Close",style: TextStyle(color: AppColors.green),),
                    ),
                  ],
                );
              },
            );
          },

          child: ContainerList(name: item["name"] ?? "not found",
            image: item["image"] ?? "image not found",
            price: item["price"],

          ),
        );
      }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 ,
          childAspectRatio: 1,mainAxisSpacing: 5,crossAxisSpacing: 5),
      ),
    )

          ]
        ),
      ),
      )
    );
  }
}
