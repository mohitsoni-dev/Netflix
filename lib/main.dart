import 'package:flutter/material.dart';
import 'package:netflix/Screens/HomePage.dart';
import 'package:netflix/THEME.dart';
import 'package:netflix/Screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: SplScreen(
        navigateAfterSplashScreen: HomePage(),
      ),
    );
  }
}
