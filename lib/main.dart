import 'package:flutter/material.dart';
import 'package:real_state_app_flutter/screens/bottom_nav_screen.dart';
import 'package:real_state_app_flutter/screens/first_screen.dart';
import 'package:real_state_app_flutter/screens/login_screen.dart';

import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: BottomNavScreen.screenName,

        routes: {
          SplashScreen.screenName: (context) => SplashScreen(),

          FirstScreen.screenName: (context) => FirstScreen(),
          LoginScreen.screenName: (context) => LoginScreen(),
          BottomNavScreen.screenName: (context) => BottomNavScreen(),
        },
      ),
    );
  }
}
