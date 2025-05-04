import 'package:flutter/material.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final List<String> sizes;
  final String category;
  final String description;
  final int stock;
  final double discount;
  final bool isFeatured;
  final DateTime createdAt;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.sizes = const ['S', 'M', 'L'],
    required this.category,
    this.description = '',
    this.stock = 0,
    this.discount = 0.0,
    this.isFeatured = false,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert Product to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'sizes': sizes,
      'category': category,
      'description': description,
      'stock': stock,
      'discount': discount,
      'isFeatured': isFeatured,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create Product from Map
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toString() ?? UniqueKey().toString(),
      name: map['name']?.toString() ?? 'Unnamed Product',
      price: _parsePrice(map['price']),
      image: map['image']?.toString() ?? 'assets/placeholder.png',
      sizes: _parseSizes(map['sizes']),
      category: map['category']?.toString() ?? 'Uncategorized',
      description: map['description']?.toString() ?? '',
      stock: _parseInt(map['stock']),
      discount: _parseDouble(map['discount']),
      isFeatured: map['isFeatured'] == true,
      createdAt: _parseDateTime(map['createdAt']),
    );
  }

  static double _parsePrice(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  static List<String> _parseSizes(dynamic value) {
    if (value is List) {
      return value.whereType<String>().toList();
    }
    return ['S', 'M', 'L'];
  }

  static int _parseInt(dynamic value) {
    if (value == null) return 0;
    if (value is int) return value;
    return int.tryParse(value.toString()) ?? 0;
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0.0;
  }

  static DateTime _parseDateTime(dynamic value) {
    if (value == null) return DateTime.now();
    if (value is DateTime) return value;
    if (value is String) {
      return DateTime.tryParse(value) ?? DateTime.now();
    }
    return DateTime.now();
  }

  // Create a copy of the product with updated values
  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? image,
    List<String>? sizes,
    String? category,
    String? description,
    int? stock,
    double? discount,
    bool? isFeatured,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      sizes: sizes ?? this.sizes,
      category: category ?? this.category,
      description: description ?? this.description,
      stock: stock ?? this.stock,
      discount: discount ?? this.discount,
      isFeatured: isFeatured ?? this.isFeatured,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Helper method to get discounted price
  double get discountedPrice => price * (1 - discount);

  // Helper method to check availability
  bool get isAvailable => stock > 0;

  // Helper method to check if product is on sale
  bool get isOnSale => discount > 0;

  // Format price with currency
  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  // Format discounted price with currency
  String get formattedDiscountedPrice =>
      '\$${discountedPrice.toStringAsFixed(2)}';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Product && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Product($id, "$name", $formattedPrice, $category)';
  }
}
