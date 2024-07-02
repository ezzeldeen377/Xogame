import 'package:flutter/material.dart';
import 'package:xogame/LoginScreen.dart';
import 'package:xogame/gamescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        GameScreen.routeName: (context) => GameScreen(),
      },
    );
  }
}
