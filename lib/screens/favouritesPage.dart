import 'package:flutter/material.dart';
import 'productDetailScreen.dart';
import 'globales.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes Favoris"),
        backgroundColor: const Color(0xFF5A6650),
      ),
      body: favourites.isEmpty
          ? const Center(child: Text("Aucun produit dans les favoris."))
          : ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (_, index) {
          final product = favourites[index];
          return ListTile(
            leading: Image.asset(product['image'], width: 50),
            title: Text(product['name']),
            subtitle: Text("${product['price']} €"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
