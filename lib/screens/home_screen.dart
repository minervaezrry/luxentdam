import 'package:flutter/material.dart';
import 'product_list_page.dart';
import 'profile_screen.dart';
import 'cart_screen.dart';
import 'favouritesPage.dart';
import 'add_edit_product_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isAdmin;

  const HomeScreen({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      _HomeContent(isAdmin: widget.isAdmin),
      FavouritesPage(),
      ProfileScreen(isAdmin: widget.isAdmin),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE1D2),
      appBar: AppBar(
        title: const Text(
          'Luxent',
          style: TextStyle(
            fontFamily: 'Georgia',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF6A6F4C),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _openCartPage,
          ),
          if (widget.isAdmin)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddEditProductScreen(
                      category: 'General',
                      sizes: ['S', 'M', 'L'],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF6A6F4C),
        selectedItemColor: const Color(0xFFEDE1D2),
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  final bool isAdmin;

  const _HomeContent({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  final List<Map<String, dynamic>> categories = const [
    {'name': 'Women', 'image': 'assets/women.png', 'count': 120},
    {'name': 'Men', 'image': 'assets/men.png', 'count': 100},
    {'name': 'Kids', 'image': 'assets/kids.png', 'count': 80},
    {'name': 'Curve', 'image': 'assets/curve.png', 'count': 45},
    {'name': 'Home Decor', 'image': 'assets/homeDecor.png', 'count': 70},
    {'name': 'Gaming', 'image': 'assets/gaming.png', 'count': 30},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCategories = categories.where((category) {
      return category['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products or categories...',
                    prefixIcon:
                        const Icon(Icons.search, color: Color(0xFF412F26)),
                    filled: true,
                    fillColor: Colors.white,
                    hintStyle: const TextStyle(color: Color(0xFF806044)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon:
                      const Icon(Icons.shopping_cart, color: Color(0xFF412F26)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (widget.isAdmin)
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6A6F4C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEditProductScreen(
                        category: 'General',
                        sizes: ['S', 'M', 'L'],
                      ),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Add New Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: filteredCategories.isEmpty
                ? const Center(
                    child: Text(
                      'No categories found.',
                      style: TextStyle(color: Color(0xFF412F26)),
                    ),
                  )
                : GridView.builder(
                    itemCount: filteredCategories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final category = filteredCategories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductListPage(
                                category: category['name'],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: const Color(0xFFFAF8F0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 5,
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(16)),
                                  child: Image.asset(
                                    category['image'],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error,
                                            stackTrace) =>
                                        const Center(
                                            child: Icon(Icons.broken_image)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      category['name'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xFF806044),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${category['count']} products',
                                      style: const TextStyle(
                                        color: Color(0xFF412F26),
                                        fontSize: 12,
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
          ),
        ],
      ),
    );
  }
}
