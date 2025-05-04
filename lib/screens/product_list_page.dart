import 'package:flutter/material.dart';
import 'productDetailScreen.dart';

class ProductListPage extends StatelessWidget {
  final String category;

  ProductListPage({required this.category});

  final Map<String, List<Map<String, dynamic>>> categorizedProducts = {
    'Women': [
      {
        'name': 'Elegant Clo',
        'price': 149.99,
        'image': 'assets/product1.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Dress',
        'price': 300.99,
        'image': 'assets/robe.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Jupe',
        'price': 250.99,
        'image': 'assets/jupe.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Luxury Dress',
        'price': 1000.99,
        'image': 'assets/soiree.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Luxury Heels',
        'price': 499.50,
        'image': 'assets/soiree2.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Pajamas',
        'price': 196.99,
        'image': 'assets/pijama.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
    'Men': [
      {
        'name': 'Pantalon',
        'price': 149.99,
        'image': 'assets/pontalon.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Luxent K-Men',
        'price': 199.99,
        'image': 'assets/kamis.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Casquette',
        'price': 300.99,
        'image': 'assets/cascette.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Chemise',
        'price': 250.99,
        'image': 'assets/chemise.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'T-shirt',
        'price': 1000.99,
        'image': 'assets/tshirt.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'Cartable',
        'price': 499.50,
        'image': 'assets/cartable.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
    'Kids': [
      {
        'name': 'kdress',
        'price': 149.99,
        'image': 'assets/kdress.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'gdress',
        'price': 300.99,
        'image': 'assets/gdress.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'kheels',
        'price': 250.99,
        'image': 'assets/kheels.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'baby',
        'price': 499.50,
        'image': 'assets/baby.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'pontalonkids',
        'price': 196.99,
        'image': 'assets/pontalonkids.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
    'Curve': [
      {
        'name': 'curve1',
        'price': 149.99,
        'image': 'assets/curve1.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'curve2',
        'price': 300.99,
        'image': 'assets/curve2.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
    'Home Decor': [
      {
        'name': 'table1',
        'price': 149.99,
        'image': 'assets/table1.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'fotey',
        'price': 300.99,
        'image': 'assets/fotey.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'fotey2',
        'price': 250.99,
        'image': 'assets/fotey2.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'cadre',
        'price': 1000.99,
        'image': 'assets/cadre.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'cheze',
        'price': 499.50,
        'image': 'assets/cheze.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'chambrekids',
        'price': 196.99,
        'image': 'assets/chambrekids.png',
        'sizes': ['36', '37', '38', '39'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
    'Gaming': [
      {
        'name': 'game1',
        'price': 149.99,
        'image': 'assets/game1.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'game2',
        'price': 300.99,
        'image': 'assets/game2.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'game3',
        'price': 300.99,
        'image': 'assets/game2.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
      {
        'name': 'game4',
        'price': 300.99,
        'image': 'assets/game2.png',
        'sizes': ['S', 'M', 'L'],
        'likes': 0,
        'liked': false,
        'comments': [],
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final products = categorizedProducts[category] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Products'),
        backgroundColor: Colors.brown.shade700,
      ),
      body: products.isEmpty
          ? const Center(
        child: Text(
          'Aucun produit dans cette catégorie.',
          style: TextStyle(fontSize: 18),
        ),
      )
          : GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        product['image'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${product['price'].toStringAsFixed(2)} DA',
                          style: TextStyle(
                            color: Colors.brown.shade600,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
