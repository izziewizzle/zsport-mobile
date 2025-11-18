import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:zsport_mobile/screens/login_page.dart';
import 'package:zsport_mobile/screens/home_page.dart';
import 'package:zsport_mobile/theme.dart';   // ← PENTING

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    Provider(
      create: (_) => CookieRequest(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final cookieRequest = context.watch<CookieRequest>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ZSPORT",
      theme: AppTheme.light,     // ← FIXED
      home: FutureBuilder(
        future: cookieRequest.get("http://localhost:8000/json/"),
        builder: (context, snapshot) {

          if (snapshot.connectionState != ConnectionState.done) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError || !cookieRequest.loggedIn) {
            return const LoginPage();
          }

          return HomePage();
        },
      ),
    );
  }
}
