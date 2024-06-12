import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uyishi_11dars/models/course.dart';
import 'package:uyishi_11dars/utils/card_provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cart, child) {
          if (cart.favorites.isEmpty) {
            return Center(child: Text('No favorites added'));
          } else {
            return ListView.builder(
              itemCount: cart.favorites.length,
              itemBuilder: (context, index) {
                Course course = cart.favorites[index];
                return ListTile(
                  leading: Image.network(course.imageUrl),
                  title: Text(course.title),
                  subtitle: Text('${course.price} so\'m'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false)
                          .removeFromFavorites(course);
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
