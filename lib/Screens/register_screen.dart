import 'package:flutter/material.dart';
import 'package:netflix/Screens/login_screen.dart';
import 'package:netflix/Screens/navigation_screen.dart';
import 'package:netflix/authentication/authentication_service.dart';
import 'package:netflix/widgets/input_field.dart';
import 'package:netflix/widgets/large_elevated_btn.dart';
import 'package:netflix/widgets/large_outlined_btn.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = '';
  String password1 = '';
  String password2 = '';
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
                          password1 = val;
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
                      label: 'Repeat Password',
                      type: 'password',
                      icon: Icons.lock,
                      onPressed: (val) {
                        setState(() {
                          password2 = val;
                        });
                      },
                    ),
                    LargeElevatedBtn(
                      label: 'SIGN UP',
                      onPressed: () {
                        handleSignUp();
                      },
                    ),
                    LargeOutlinedBtn(
                      label: 'SIGN IN',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
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

  void handleSignUp() async {
    //TODO: Show Loader
    if (password1 != password2) return;
    String res = await context.read<AuthenticationService>().signUp(
          email: email,
          password: password1,
        );

    if (res == "Signed up") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => NavigationScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
      ));
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) {
    //       return res == "Signed up" ? NavigationScreen() : RegisterScreen();
    //     },
    //   ),
    // );
  }
}
