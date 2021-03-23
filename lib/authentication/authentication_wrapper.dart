import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends StatelessWidget {
  final Widget child;
  AuthenticationWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return child;
    }
    return WelcomeScreen();
  }
}
