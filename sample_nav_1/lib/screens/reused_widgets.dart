import 'package:flutter/material.dart';

class ReusedScreen extends StatelessWidget {
  const ReusedScreen({Key? key, this.inTabBar = false}) : super(key: key);
  final bool inTabBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: inTabBar
          ? null
          : AppBar(
              automaticallyImplyLeading: !inTabBar,
              title: const Text('ReusedScreen')),
      body: Center(
        child: inTabBar
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/reused_screen');
                },
                child: const Text('Open this window outside a tabBar'))
            : const Text('You are now outside the tabBar'),
      ),
    );
  }
}
