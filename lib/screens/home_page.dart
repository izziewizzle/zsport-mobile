import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'product_list_page.dart';
import 'my_product_page.dart';
import 'add_product_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(title: const Text('ZSPORT')),
      drawer: AppDrawer(),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // =============== ROW 1 ===============
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _menuButton(
                    context,
                    icon: Icons.store,
                    label: "All Products",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ProductListPage()),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Menampilkan semua produk...",
                            style: TextStyle(fontSize: 18),
                          ),
                          backgroundColor: primary,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 20),
                  _menuButton(
                    context,
                    icon: Icons.inventory_2,
                    label: "My Products",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MyProductPage()),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Menampilkan produk kamu...",
                            style: TextStyle(fontSize: 18),
                          ),
                          backgroundColor: primary,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // =============== ROW 2 ===============
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _menuButton(
                    context,
                    icon: Icons.add_circle,
                    label: "Tambah Produk",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddProductPage()),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Buat produk baru...",
                            style: TextStyle(fontSize: 18),
                          ),
                          backgroundColor: primary,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= BUTTON COMPONENT =================

  Widget _menuButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final primary = Theme.of(context).colorScheme.primary;
    final secondary = Theme.of(context).colorScheme.secondary;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 22),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
