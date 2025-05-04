import 'package:flutter/material.dart';
import 'ProductDetailScreen.dart';
import 'add_edit_product_screen.dart';
import 'auth_service.dart';

class ProductGridPage extends StatelessWidget {
  final String categoryName;

  ProductGridPage({Key? key, required this.categoryName}) : super(key: key);

  final Map<String, List<Map<String, dynamic>>> categorizedProducts = {
    'Women': [
      {
        'name': 'Elegant Clo',
        'price': 149.99,
        'image': 'assets/product1.png',
        'sizes': ['S', 'M', 'L'],
        'colors': ['Noir', 'Rouge']
      },
      {
        'name': 'Dress',
        'price': 300.99,
        'image': 'assets/robe.png',
        'sizes': ['S', 'M', 'L'],
        'colors': ['Bleu', 'Or']
      },
      // Add other women's products...
    ],
    'Men': [
      {
        'name': 'Pontalon',
        'price': 149.99,
        'image': 'assets/pontalon.png',
        'sizes': ['S', 'M', 'L'],
        'colors': ['Noir', 'Gris']
      },
      {
        'name': 'Luxent-K-Men',
        'price': 199.99,
        'image': 'assets/kamis.png',
        'sizes': ['36', '37', '38', '39'],
        'colors': ['Blanc', 'Beige']
      },
      // Add other men's products...
    ],
    // Add other categories as needed...
  };

  @override
  Widget build(BuildContext context) {
    final products = categorizedProducts[categoryName] ?? [];
    final isAdmin = AuthService.currentUser?.isAdmin ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.brown[800],
        actions: isAdmin
            ? [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddEditProductScreen(
                          category: categoryName,
                          sizes: ['S', 'M', 'L'], // Default sizes
                        ),
                      ),
                    ).then((newProduct) {
                      if (newProduct != null) {
                        // In a real app, you would update your database here
                        // For now, we'll just show a snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Product added!')),
                        );
                      }
                    });
                  },
                ),
              ]
            : null,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.70,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(15)),
                        child: Image.asset(
                          product['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (isAdmin)
                        Positioned(
                          top: 8,
                          right: 8,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              // Show confirmation dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Delete Product'),
                                  content: Text(
                                      'Are you sure you want to delete this product?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // In a real app, you would delete from database here
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(content: Text('Product deleted')),
                                        );
                                      },
                                      child: Text('Delete',
                                          style: TextStyle(color: Colors.red)),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.favorite_border,
                          color: Colors.red, size: 18),
                      Icon(Icons.comment, color: Colors.grey, size: 18),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text('💰 ${product['price']} €',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  child: Text(
                      '📏 Tailles: ${product['sizes'].join(", ")}',
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                      '🎨 Couleurs: ${product['colors'].join(", ")}',
                      style: const TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: const Text('See more',
                        style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}