import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'image': 'sports.png', 'label': 'Sports'},
      {'image': 'men.png', 'label': 'Men'},
      {'image': 'kids.png', 'label': 'Kids'},
      {'image': 'curve.png', 'label': 'Curve'},
      {'image': 'women.png', 'label': 'Women'},
      {'image': 'baby.png', 'label': 'Baby'},
      {'image': 'home.png', 'label': 'Home'},
      {'image': 'tops.png', 'label': 'Tops'},
      {'image': 'jewelry.png', 'label': 'Jewelry'},
      {'image': 'beachwear.png', 'label': 'Beachwear'},
      {'image': 'dresses.png', 'label': 'Dresses'},
      {'image': 'shoes.png', 'label': 'Shoes'},
      {'image': 'sleepwear.png', 'label': 'Sleepwear'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/categories/${category['image']}',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category['label']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF412F26),
                  ),
                ),
                const SizedBox(height: 4),
                ElevatedButton(
                  onPressed: () {
                    // Action pour le bouton "Details"
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6A6F4C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
    );
  }
}
