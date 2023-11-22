import 'dart:convert' as convert;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:peternakan_gacor/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String confirmPassword = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Username",
                icon: const Icon(Icons.people),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              onChanged: (String? value) {
                setState(() {
                  username = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  username = value!;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Username tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                icon: const Icon(
                  Icons.lock_outline,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              onChanged: (String? value) {
                setState(() {
                  password = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  password = value!;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Konfirmasi Password",
                icon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              onChanged: (String? value) {
                setState(() {
                  confirmPassword = value!;
                });
              },
              onSaved: (String? value) {
                setState(() {
                  confirmPassword = value!;
                });
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 36.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Submit to Django server and wait for response
                  final response = await request.postJson(
                      "muhammad-yusuf210-tugas.pbp.cs.ui.ac.id/auth/register/",
                      convert.jsonEncode(<String, String>{
                        'username': username,
                        'password': password,
                        'confirmPassword': confirmPassword,
                      }));
                  if (response['status'] == 'Berhasil') {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Akun berhasil terdaftar!"),
                    ));
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Akun gagal terdaftar! Silahkan coba lagi."),
                    ));
                  }
                }
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
