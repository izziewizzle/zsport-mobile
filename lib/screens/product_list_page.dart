import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:zsport_mobile/screens/product_detail_page.dart';
import 'package:zsport_mobile/models/product.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  Future<List<Product>> fetchProducts(BuildContext context) async {
    final request = context.watch<CookieRequest>();
    final response = await request.get(
      "http://localhost:8000/json/",
    );

    return response
        .map<Product>((json) => Product.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Products")),
      body: FutureBuilder(
        future: fetchProducts(context),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Product> items = snapshot.data!;

          if (items.isEmpty) {
            return Center(child: Text("Tidak ada produk."));
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
