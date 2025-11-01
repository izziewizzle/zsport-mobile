import 'package:flutter/material.dart';

void main() => runApp(const ZSPORTApp());

class ZSPORTApp extends StatelessWidget {
  const ZSPORTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZSPORT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const ZSPORTHomePage(),
    );
  }
}

class ZSPORTHomePage extends StatelessWidget {
  const ZSPORTHomePage({super.key});

  void _showSnack(BuildContext context, String message) {
    final m = ScaffoldMessenger.of(context);
    m.clearSnackBars();
    m.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ZSPORT')),
      body: Center(
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
                      _showSnack(context, 'Kamu telah menekan tombol All Products'),
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
                      _showSnack(context, 'Kamu telah menekan tombol My Products'),
                ),
              ),
              const SizedBox(height: 12),

              // Create Product (Merah)
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Create Product'),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: () =>
                      _showSnack(context, 'Kamu telah menekan tombol Create Product'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
