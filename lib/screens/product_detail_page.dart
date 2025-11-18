import 'package:flutter/material.dart';
import 'package:zsport_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (product.thumbnail.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.thumbnail,
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),

            const SizedBox(height: 20),

            Text(
              product.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text("Rp ${product.price}",
                style: const TextStyle(fontSize: 18)),

            const SizedBox(height: 8),

            Text("Category: ${product.category}",
                style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 8),

            Text("Featured: ${product.isFeatured ? "Yes" : "No"}",
                style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            const Text(
              "Description:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 8),

            Text(
              product.description,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 30),

            Center(
              child: FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Kembali"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
