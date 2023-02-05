import 'package:auth_with_firebase/screens/home_screen.dart';
import 'package:auth_with_firebase/screens/profile_screen.dart';
import 'package:auth_with_firebase/screens/registration_screen.dart';
import 'package:auth_with_firebase/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

late SharedPreferences prefs;

void main() async {
  //есть есть какие-то действия помимо runApp
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  prefs = await SharedPreferences.getInstance();

  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => const AuthScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    ),
  );
}
