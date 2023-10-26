import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/cart.dart';
import 'product.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = [
      Product('Produk 1', 10.0),
      Product('Produk 2', 15.0),
      Product('Produk 3', 20.0),
      Product('Produk 4', 20.0),
      Product('Produk 5', 20.0),
      Product('Produk 6', 20.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                final cart = context.read<Cart>();
                cart.addItem(product);
              },
            ),
          );
        },
      ),
    );
  }
}
