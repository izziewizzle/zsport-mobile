import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:zsport_mobile/screens/product_detail_page.dart';
import 'package:zsport_mobile/models/product.dart';

class MyProductPage extends StatefulWidget {
  const MyProductPage({super.key});

  @override
  _MyProductPageState createState() => _MyProductPageState();
}

class _MyProductPageState extends State<MyProductPage> {

  Future<List<Product>> fetchMyProducts(BuildContext context) async {
    final request = context.watch<CookieRequest>();
    final response = await request.get("http://localhost:8000/json/");

    final username = request.jsonData["username"];

    return response
        .map<Product>((json) => Product.fromJson(json))
        .where((p) => p.userUsername == username)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Products")),
      body: FutureBuilder(
        future: fetchMyProducts(context),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Product> items = snapshot.data!;

          if (items.isEmpty) {
            return Center(child: Text("Kamu belum punya produk."));
          }

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              
              final Product p = items[index];

              return Card(
                margin: const EdgeInsets.all(12),
                child: ListTile(
                  title: Text(p.name),
                  subtitle: Text("Rp ${p.price}"),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(product: p),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
