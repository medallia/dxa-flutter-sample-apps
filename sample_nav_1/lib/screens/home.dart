import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tabbar_screen_group');
                },
                child: const Text("TabBar screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tabbar_screen_individual');
                },
                child: const Text("TabBar screen with nav")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/masking_screen');
                },
                child: const Text("Masking screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/popups_screen');
                },
                child: const Text("Popups screen"))
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
