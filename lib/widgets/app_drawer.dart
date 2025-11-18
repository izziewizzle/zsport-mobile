import 'package:flutter/material.dart';
import 'package:zsport_mobile/screens/home_page.dart';
import 'package:zsport_mobile/screens/my_product_page.dart';
import 'package:zsport_mobile/screens/add_product_page.dart';
import 'package:zsport_mobile/screens/login_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          DrawerHeader(
            decoration: BoxDecoration(color: primary),
            child: const Text(
              "ZSPORT",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => HomePage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.grid_view_rounded),
            title: const Text("My Products"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MyProductPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.add_box_outlined),
            title: const Text("Add Product"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddProductPage()),
              );
            },
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
