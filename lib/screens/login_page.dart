import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:zsport_mobile/screens/register.dart';
import 'package:zsport_mobile/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 24),

            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final response = await request.login(
                    "http://localhost:8000/auth/login/",
                    {
                      "username": _username.text,
                      "password": _password.text,
                    },
                  );

                  if (request.loggedIn) {
                    // Simpan username
                    request.jsonData["username"] = response["username"];

                    // Pindah ke HomePage
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => HomePage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(response["message"])),
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: TextButton(
                child: const Text(
                  "Don’t have an account? Register",
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
