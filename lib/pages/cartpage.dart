import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(builder: (context, value, child) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 80, right: 80, bottom: 40, top: 160),
                  child: Text(
                    textAlign: TextAlign.center,
                    'My Cart',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: EdgeInsets.all(12),
                    itemBuilder: (content, index) {
                      return Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: Image.asset(
                                value.cartItems[index][2],
                                height: 36,
                              ),
                              title: Text(value.cartItems[index][0]),
                              subtitle: Text('\$' + value.cartItems[index][1]),
                              trailing: IconButton(
                                icon: Icon(Icons.cancel),
                                onPressed: () => Provider.of<CartModel>(context,
                                        listen: false)
                                    .removeItemFromCart(index),
                              ),
                            )),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(color: Colors.green[100]),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$' + value.calculateTotal(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        //pay now
                        Container(
                          decoration: BoxDecoration(),
                          child: (Row(
                            children: [
                              Text(
                                'PAy Now',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_back_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                )
              ]);
        }));
  }
}
