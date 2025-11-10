import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/add_product_page.dart';

void main() => runApp(const ZSPORTApp());

class ZSPORTApp extends StatelessWidget {
  const ZSPORTApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZSPORT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (_) => const ZSPORTHomePage(),
        '/add-product': (_) => const AddProductPage(),
      },
    );
  }
}
