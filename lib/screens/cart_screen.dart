import 'package:flutter/material.dart';
import 'globales.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key}); // SUPPRIME le paramètre ici

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier")),
      body: panier.isEmpty
          ? const Center(child: Text("Votre panier est vide."))
          : ListView.builder(
        itemCount: panier.length,
        itemBuilder: (context, index) {
          final produit = panier[index];
          return ListTile(
            title: Text(produit['name']),
            subtitle: Text("${produit['price']} €"),
            leading: Image.asset(produit['image'], width: 50),
          );
        },
      ),
    );
  }
}
