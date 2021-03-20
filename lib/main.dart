import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Screens/HomePage.dart';
import 'package:netflix/THEME.dart';
import 'package:netflix/Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:netflix/authentication/authentication_service.dart';
import 'package:netflix/authentication/authentication_wrapper.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        home: SplScreen(
          navigateAfterSplashScreen: AuthenticationWrapper(),
        ),
      ),
    );
  }
}
