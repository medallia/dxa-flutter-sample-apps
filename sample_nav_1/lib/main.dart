import 'package:sample_nav_1/screens/home.dart';
import 'package:sample_nav_1/screens/masking.dart';
import 'package:sample_nav_1/screens/popups.dart';
import 'package:sample_nav_1/screens/tabbar_individual.dart';
import 'package:sample_nav_1/screens/tabbar_group.dart';
import 'package:sample_nav_1/screens/login.dart';
import 'package:sample_nav_1/screens/registration.dart';
import 'package:sample_nav_1/screens/reused_widgets.dart';
import 'package:sample_nav_1/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:medallia_dxa/medallia_dxa.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initalize the sdk with your account and property.
  await MedalliaDxa.initialize(
      dxaConfig: DxaConfig(
    property: 0,
    account: 0,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome_screen',
      //Put the observer provided by the SDK.
      navigatorObservers: [MedalliaDxa.routeObserver],
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/registration_screen': (context) => const RegistrationScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/tabbar_screen_group': (context) => const TabBarScreenGroup(),
        '/tabbar_screen_individual': (context) =>
            const TabBarScreenIndividual(),
        '/masking_screen': (context) => const MaskingScreen(),
        '/popups_screen': (context) => const PopupsScreen(),
        '/reused_screen': (context) => const ReusedScreen(
              inTabBar: false,
            )
      },
    );
  }
}
