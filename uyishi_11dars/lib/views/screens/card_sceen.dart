import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_11dars/models/course.dart';
import 'package:uyishi_11dars/utils/card_provider.dart';



class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.cart.isEmpty) {
            return Center(child: Text('No items in the cart'));
          } else {
            return ListView.builder(
              itemCount: cart.cart.length,
              itemBuilder: (context, index) {
                Course course = cart.cart[index];
                return ListTile(
                  leading: Image.network(course.imageUrl),
                  title: Text(course.title),
                  subtitle: Text('${course.price} so\'m'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeFromCart(course);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
