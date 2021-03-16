import 'package:flutter/material.dart';
import 'package:netflix/authentication/authentication_service.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            context.read<AuthenticationService>().signIn(
                  email: 'test@gmail.com',
                  password: '123456',
                );
          },
          child: Text('login'),
        ),
      ],
    );
  }
}
