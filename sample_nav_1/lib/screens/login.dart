import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: 'Enter your email'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter your password'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home_screen', ((route) => false));
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}
