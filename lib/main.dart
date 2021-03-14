import 'package:flutter/material.dart';
import 'package:netflix/Screens/HomePage.dart';
import 'package:netflix/THEME.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      home: HomePage(),
    );
  }
}
