import 'package:flutter/material.dart';
import 'package:zsport_mobile/models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            if (product.thumbnail.isNotEmpty)
              Image.network(
                product.thumbnail,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),

            const SizedBox(height: 16),

            Text("Name: ${product.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 8),

            Text("Price: Rp ${product.price}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),

            Text("Category: ${product.category}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),

            Text("Featured: ${product.isFeatured ? "Yes" : "No"}",
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),

            Text("Description:",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 6),

            Text(product.description, style: const TextStyle(fontSize: 16)),

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
