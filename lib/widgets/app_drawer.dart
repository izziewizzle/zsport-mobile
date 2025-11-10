import 'package:flutter/material.dart';

class AppMainDrawer extends StatelessWidget {
  const AppMainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const ListTile(
              title: Text('Menu'),
              dense: true,
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Halaman Utama'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Tambah Produk'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/add-product');
              },
            ),
          ],
        ),
      ),
    );
  }
}
