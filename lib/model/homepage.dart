import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../component/grocery_item_tile.dart';
import '../pages/cartpage.dart';
import 'cart_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CartPage();
                },
              ))),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 48,
          ),
          //good morning
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Good Morning'),
          ),
          const SizedBox(
            height: 4,
          ),
          //lets order fresh items for u
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Lets order fresh items for you'),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(),
          ),
          const SizedBox(
            height: 24,
          ),
          //fresh items + grid

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Fresh Items',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .addItmToCart(index);
                      },
                    );
                  });
            },
          )),
        ],
      )),
    );
  }
}
