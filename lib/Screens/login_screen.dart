import 'package:flutter/material.dart';
import 'package:netflix/Screens/register_screen.dart';
import 'package:netflix/authentication/authentication_service.dart';
import 'package:netflix/widgets/input_field.dart';
import 'package:netflix/widgets/large_elevated_btn.dart';
import 'package:netflix/widgets/large_outlined_btn.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'logo',
                      child: Image(
                        image: AssetImage('assets/logo.png'),
                        width: 180.0,
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      'Enjoy the world of entertainment.',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    // Email Field
                    InputField(
                      label: 'Email Address',
                      type: 'email',
                      icon: Icons.person,
                      onPressed: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    Divider(
                      thickness: 1.5,
                      indent: 32.0,
                      endIndent: 32.0,
                    ),
                    // Password Field
                    InputField(
                      label: 'Password',
                      type: 'password',
                      icon: Icons.lock,
                      onPressed: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    LargeElevatedBtn(
                      label: 'SIGN IN',
                      onPressed: () {
                        handleSignIn();
                      },
                    ),
                    LargeOutlinedBtn(
                      label: 'SIGN UP',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleSignIn() {
    context.read<AuthenticationService>().signIn(
          email: email,
          password: password,
        );
    dispose();
    Navigator.pop(context);
  }
}
