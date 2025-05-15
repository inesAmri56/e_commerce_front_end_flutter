import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../widgets/circularbutton.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final List<Map<String, dynamic>> items = [
    {
      "name": "Swatch",
      "image": "assets/swatch.png",
      "price": 130.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "stock": 40,
      "count": 0
    },
    {
      "name": "Bag",
      "image": "assets/bags.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "stock": 14,
      "count": 0
    },
    {
      "name": "Shoes",
      "image": "assets/shoes.png",
      "price": 140.0,
      "description":
      "This high-quality product combines style and functionality, perfect for everyday use. Crafted with care to meet your expectations",
      "stock": 5,
      "count": 0
    },
  ];

  int get totalItemCount {
    return items.fold(0, (sum, item) => sum + (item['count'] as int));
  }

  double get totalPrice {
    return items.fold(
        0.0,
            (sum, item) =>
        sum + (item['count'] as int) * (item['price'] as double));
  }

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
              if (totalItemCount > 0)
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
                      '$totalItemCount',
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        item["image"],
                        height: 80,
                        width: 80,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "\$${item["price"]}",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          BuildCircleButton("-", () {
                            setState(() {
                              if (items[index]["count"] > 0) {
                                items[index]["count"]--;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AlertDialog(
                                        title: const Text(
                                            "Would you like to remove this product?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("No"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                items.removeAt(index);
                                              });
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Remove"),
                                          ),
                                        ],
                                      ),
                                );
                              }
                            });
                          }),
                          const SizedBox(width: 10),
                          Text("${items[index]["count"]}",
                              style: const TextStyle(fontSize: 18)),
                          const SizedBox(width: 10),
                          BuildCircleButton("+", () {
                            setState(() {
                              if (items[index]["count"] <
                                  items[index]["stock"]) {
                                items[index]["count"]++;
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (_) =>
                                      AlertDialog(
                                        title: const Text(
                                            "You passed the stock"),
                                        actions: [
                                          IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.done))
                                        ],
                                      ),
                                );
                              }
                            });
                          })
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Proceeding to checkout...")),
                      );
                    },
                    icon: Image.asset(
                      "assets/cardsh-.png",
                      height: 24,
                      width: 50,
                    ),
                    label: const Text(
                      "Checkout",
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      backgroundColor: AppColors.green,
                      foregroundColor: AppColors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

