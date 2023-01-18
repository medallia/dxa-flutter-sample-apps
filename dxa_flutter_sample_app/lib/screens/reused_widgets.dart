import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:flutter/material.dart';

class ReusedScreen extends StatelessWidget {
  const ReusedScreen({Key? key, this.inTabBar = false}) : super(key: key);
  final bool inTabBar;
  @override
  Widget build(BuildContext context) {
    ///We also put a ScreenWidget here because this is going to be an
    ///independent screen. When this is inside a TabBar, the screenName will
    ///be ignored and the name provided to the ScreenWidget in the TabBar will
    ///be the one used.
    return ScreenWidget(
      screenName: 'reused_screen_outside_tabbar',
      child: Scaffold(
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
      ),
    );
  }
}
