import 'package:decibel_sdk/decibel_sdk.dart';
import 'package:dxa_flutter_sample_app/screens/home.dart';
import 'package:dxa_flutter_sample_app/screens/masking.dart';
import 'package:dxa_flutter_sample_app/screens/popups.dart';
import 'package:dxa_flutter_sample_app/screens/tabbar.dart';
import 'package:dxa_flutter_sample_app/screens/login.dart';
import 'package:dxa_flutter_sample_app/screens/registration.dart';
import 'package:dxa_flutter_sample_app/screens/reused_widgets.dart';
import 'package:dxa_flutter_sample_app/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initalize the sdk with your account and property.
  await DecibelSdk.initialize(0, 0);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'welcome_screen',
      //Put the observers provided by the SDK.
      navigatorObservers: [...DecibelSdk.routeObservers],
      routes: {
        ///You could wrap your WidgetScreen here, but to  make it easier to
        ///refactor we recommend to always wrap the Scaffold widget directly
        '/': (context) => const WelcomeScreen(),
        '/registration_screen': (context) => const RegistrationScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/home_screen': (context) => const HomeScreen(),
        '/tabbar_screen': (context) => const TabBarScreen(),
        '/masking_screen': (context) => const MaskingScreen(),
        '/popups_screen': (context) => const PopupsScreen(),
        '/reused_screen': (context) => const ReusedScreen(
              inTabBar: false,
            )
      },
    );
  }
}

///Example for an app using the navigation 2.0 API. If you are using this API
///without any 3rd party packages, add the DecibelSdk.routeObservers to the
///Navigator widget
class MyAppNewNavigation extends StatelessWidget {
  MyAppNewNavigation({super.key});

  final _router = GoRouter(
    initialLocation: '/welcome_screen',
    //Because we are not using the Material.router, we need to put the observers
    //here or in the Navigator widget, whichever one your app uses.
    observers: [...DecibelSdk.routeObservers],
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/home_screen',
        builder: (context, state) => const TabBarScreen(),
      ),
      GoRoute(
        path: '/registration_screen',
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/login_screen',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home_screen',
        builder: (context, state) => const TabBarScreen(),
      ),
      GoRoute(
          path: '/reused_screen',
          builder: (context, state) => const ReusedScreen(
                inTabBar: false,
              )),
    ],
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
