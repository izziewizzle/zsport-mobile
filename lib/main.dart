import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:zsport_mobile/screens/login_page.dart';
import 'package:zsport_mobile/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cookieRequest = CookieRequest();

  runApp(
    Provider(
      create: (_) => cookieRequest,
      child: MaterialApp(
        home: LoginPage(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cookieRequest = Provider.of<CookieRequest>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ZSPORT",
      home: FutureBuilder(
        future: cookieRequest.get(
          "http://localhost:8000/json/"
        ),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState != ConnectionState.done) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          // Cookie invalid → belum login
          if (snapshot.hasError) {
            return LoginPage();
          }

          // Cookie valid → langsung ke Home
          return HomePage();
        },
      ),
    );
  }
}
