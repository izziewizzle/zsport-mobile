import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'product_list_page.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final nameC = TextEditingController();
  final priceC = TextEditingController();
  final descC = TextEditingController();
  final thumbC = TextEditingController();

  String category = "equipment";
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Produk")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(labelText: "Nama Produk"),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: priceC,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Harga"),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: descC,
              decoration: const InputDecoration(labelText: "Deskripsi"),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: thumbC,
              decoration: const InputDecoration(labelText: "Thumbnail URL"),
            ),

            const SizedBox(height: 16),

            DropdownButtonFormField(
              value: category,
              decoration: const InputDecoration(labelText: "Kategori"),
              items: const [
                DropdownMenuItem(value: "clothing", child: Text("Clothing")),
                DropdownMenuItem(value: "footwear", child: Text("Footwear")),
                DropdownMenuItem(value: "equipment", child: Text("Equipment")),
                DropdownMenuItem(value: "accessories", child: Text("Accessories")),
                DropdownMenuItem(value: "merchandise", child: Text("Merchandise")),
              ],
              onChanged: (v) => setState(() => category = v!),
            ),

            CheckboxListTile(
              value: isFeatured,
              onChanged: (v) => setState(() => isFeatured = v!),
              title: const Text("Featured Product"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await request.post(
                  "http://localhost:8000/create-product-ajax/",
                  {
                    "name": nameC.text,
                    "price": priceC.text,
                    "description": descC.text,
                    "thumbnail": thumbC.text,
                    "category": category,
                    "is_featured": isFeatured.toString(),
                  },
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ProductListPage()),
                );
              },
              child: const Text("Tambah Produk"),
            ),
          ],
        ),
      ),
    );
  }
}
