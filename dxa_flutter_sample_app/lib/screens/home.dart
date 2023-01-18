import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tabbar_screen');
                },
                child: Text("TabBar screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/masking_screen');
                },
                child: Text("Masking screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/popups_screen');
                },
                child: Text("Popups screen"))
          ]
              .map((e) => Padding(
                    padding: EdgeInsets.all(16),
                    child: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
