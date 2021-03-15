import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplScreen extends StatefulWidget {
  final Widget navigateAfterSplashScreen;
  SplScreen({@required this.navigateAfterSplashScreen});

  @override
  _SplScreenState createState() => _SplScreenState();
}

class _SplScreenState extends State<SplScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: widget.navigateAfterSplashScreen,
      title: Text('WELCOME TO NETFLIX'),
      image: Image.asset('assets/logo.png'),
      backgroundColor: Colors.black,
      photoSize: 100.0,
      loaderColor: Colors.red,
    );
  }
}
