import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class ProductScreen extends StatelessWidget {
  final List<Product> products = [
    Product('Produk 1', 20.0),
    Product('Produk 2', 20.0),
    Product('Produk 3', 20.0),
    Product('Produk 4', 20.0),
    Product('Produk 5', 20.0),
    Product('Produk 6', 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
            // Tambahkan tombol "Tambahkan ke Keranjang" di sini
          );
        },
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  final Map<Product, int> cart;
  final List<Product> products;

  CartScreen({required this.cart, required this.products});

  @override
  Widget build(BuildContext context) {
    // Hitung total harga produk dalam keranjang
    double total = 0.0;
    cart.forEach((product, quantity) {
      total += product.price * quantity;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart.keys.elementAt(index);
          final quantity = cart[product];
          return ListTile(
            title: Text('${product.name} (x$quantity)'),
            subtitle: Text('\$${(product.price * quantity!).toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Total: \$${total.toStringAsFixed(2)}'),
      ),
    );
  }
}
