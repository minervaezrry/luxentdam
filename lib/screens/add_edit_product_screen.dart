// add_edit_product_screen.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'product.dart';

class AddEditProductScreen extends StatefulWidget {
  final Product? product;
  final String category;
  final List<String> sizes;
  
  const AddEditProductScreen({
    Key? key,
    this.product,
    required this.category,
    required this.sizes,
  }) : super(key: key);

  @override
  _AddEditProductScreenState createState() => _AddEditProductScreenState();
}

class _AddEditProductScreenState extends State<AddEditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _stockController;
  late TextEditingController _discountController;
  late TextEditingController _categoryController;
  late List<String> _selectedSizes;
  File? _imageFile;
  bool _isFeatured = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product?.name ?? '');
    _priceController = TextEditingController(
      text: widget.product?.price.toString() ?? '',
    );
    _descriptionController = TextEditingController(
      text: widget.product?.description ?? '',
    );
    _stockController = TextEditingController(
      text: widget.product?.stock.toString() ?? '0',
    );
    _discountController = TextEditingController(
      text: widget.product?.discount.toString() ?? '0.0',
    );
    _categoryController = TextEditingController(text: widget.category);
    _selectedSizes = widget.product?.sizes ?? widget.sizes;
    _isFeatured = widget.product?.isFeatured ?? false;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _imageFile != null
                    ? Image.file(_imageFile!, fit: BoxFit.cover)
                    : widget.product != null
                        ? Image.asset(widget.product!.image, fit: BoxFit.cover)
                        : Center(child: Icon(Icons.add_a_photo, size: 50)),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            TextFormField(
              controller: _stockController,
              decoration: const InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _discountController,
              decoration: const InputDecoration(labelText: 'Discount (0.0 - 1.0)'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category'),
              readOnly: true,
            ),
            SwitchListTile(
              title: Text('Featured Product'),
              value: _isFeatured,
              onChanged: (value) {
                setState(() {
                  _isFeatured = value;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Available Sizes:'),
            Wrap(
              children: widget.sizes.map((size) {
                return FilterChip(
                  label: Text(size),
                  selected: _selectedSizes.contains(size),
                  onSelected: (selected) {
                    setState(() {
                      if (selected) {
                        _selectedSizes.add(size);
                      } else {
                        _selectedSizes.remove(size);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveProduct,
              child: const Text('Save Product'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: widget.product?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        price: double.parse(_priceController.text),
        image: _imageFile != null 
            ? _imageFile!.path 
            : widget.product?.image ?? 'assets/placeholder.png',
        sizes: _selectedSizes,
        category: _categoryController.text,
        description: _descriptionController.text,
        stock: int.tryParse(_stockController.text) ?? 0,
        discount: double.tryParse(_discountController.text) ?? 0.0,
        isFeatured: _isFeatured,
      );
      Navigator.pop(context, product);
    }
  }
}