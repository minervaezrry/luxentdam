import 'package:flutter/material.dart';
import 'globales.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isLiked = false;
  List<String> comments = [];
  final TextEditingController _commentController = TextEditingController();

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        if (!favourites.contains(widget.product)) {
          favourites.add(widget.product);
        }
      } else {
        favourites.remove(widget.product);
      }
    });
  }

  void _addComment() {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        comments.add(text);
        _commentController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F1E7),
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: const Color(0xFF5A6650),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product['image'], height: 220, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: _toggleLike,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey.shade700,
                        size: 26,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: () {
                      if (!panier.contains(widget.product)) {
                        setState(() {
                          panier.add(widget.product);
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Produit ajouté au panier')),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Produit déjà dans le panier')),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFA1876C),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 26),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Détails", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5A6650))),
                  const SizedBox(height: 10),
                  Text("Nom : ${product['name']}", style: const TextStyle(fontSize: 16)),
                  Text("Prix : ${product['price']} €", style: const TextStyle(fontSize: 16)),
                  Text("Tailles : ${product['sizes'].join(', ')}", style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Commentaires", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF5A6650))),
                  const SizedBox(height: 10),
                  Container(
                    height: 140,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFE8D8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: comments.isEmpty
                        ? const Center(child: Text("Aucun commentaire"))
                        : ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (_, index) => Text("• ${comments[index]}"),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _commentController,
                          decoration: InputDecoration(
                            hintText: "Écrire...",
                            filled: true,
                            fillColor: const Color(0xFFA1876C),
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: _addComment,
                        icon: const Icon(Icons.send, color: Color(0xFF4B3228)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
