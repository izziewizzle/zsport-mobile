import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class ZSPORTHomePage extends StatelessWidget {
  const ZSPORTHomePage({super.key});

  void _snack(BuildContext ctx, String msg) {
    final m = ScaffoldMessenger.of(ctx);
    m.clearSnackBars();
    m.showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZSPORT')),
      drawer: const AppMainDrawer(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // All Products (Biru)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.store),
                    label: const Text('All Products'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () =>
                        _snack(context, 'Kamu telah menekan tombol All Products di ZSPORT'),
                  ),
                ),
                const SizedBox(height: 12),

                // My Products (Hijau)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.inventory_2),
                    label: const Text('My Products'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () =>
                        _snack(context, 'Kamu telah menekan tombol My Products di ZSPORT'),
                  ),
                ),
                const SizedBox(height: 12),

                // Create Product (Merah) -> ke halaman form
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: const Icon(Icons.add_circle),
                    label: const Text('Tambah Produk'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/add-product'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
