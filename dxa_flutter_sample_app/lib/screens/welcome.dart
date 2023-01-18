import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      screenName: 'welcome_screen',
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Log In'),
                onPressed: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
              ),
              ElevatedButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.pushNamed(context, '/registration_screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
