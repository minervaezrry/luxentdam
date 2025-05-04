import 'package:flutter/material.dart';
import 'product.dart';

class AddEditProductScreen extends StatefulWidget {
  final String category;
  final List<Product> initialProducts;
  final Function(List<Product>) onProductsUpdated;

  const AddEditProductScreen({
    super.key,
    required this.category,
    required this.initialProducts,
    required this.onProductsUpdated,
  });

  @override
  State<AddEditProductScreen> createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  late List<Product> _products;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _products = List.from(widget.initialProducts);
  }

  void _addProduct() {
    setState(() {
      _products.add(Product(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: '',
        price: 0.0,
        image: 'assets/placeholder.png', // Default placeholder image
        sizes: ['S', 'M', 'L'],
        category: widget.category,
      ));
    });
  }

  void _updateProduct(int index, Product updatedProduct) {
    setState(() {
      _products[index] = updatedProduct;
    });
    widget.onProductsUpdated(_products);
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
    widget.onProductsUpdated(_products);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage ${widget.category} Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                widget.onProductsUpdated(_products);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return _buildProductCard(index, product);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductCard(int index, Product product) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: product.name,
              decoration: const InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
              validator: (value) =>
                  value?.isEmpty ?? true ? 'Name is required' : null,
              onChanged: (value) => _updateProduct(
                index,
                product.copyWith(name: value),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: product.price.toString(),
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value?.isEmpty ?? true) return 'Price is required';
                if (double.tryParse(value!) == null) return 'Invalid price';
                return null;
              },
              onChanged: (value) => _updateProduct(
                index,
                product.copyWith(price: double.tryParse(value) ?? 0.0),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: product.image,
              items: [
                'assets/robe.png',
                'assets/jupe.png',
                'assets/soiree.png',
                'assets/beauty.png',
              ].map((image) {
                return DropdownMenuItem(
                  value: image,
                  child: Row(
                    children: [
                      Image.asset(
                        image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10),
                      Text(image.split('/').last),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  _updateProduct(
                    index,
                    product.copyWith(image: value),
                  );
                }
              },
              decoration: const InputDecoration(
                labelText: 'Product Image',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Available Sizes:'),
            Wrap(
              spacing: 8,
              children: ['XS', 'S', 'M', 'L', 'XL'].map((size) {
                return FilterChip(
                  label: Text(size),
                  selected: product.sizes.contains(size),
                  onSelected: (selected) {
                    final newSizes = List<String>.from(product.sizes);
                    if (selected) {
                      newSizes.add(size);
                    } else {
                      newSizes.remove(size);
                    }
                    _updateProduct(
                      index,
                      product.copyWith(sizes: newSizes),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteProduct(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}