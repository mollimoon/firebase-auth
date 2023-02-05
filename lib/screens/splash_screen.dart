import 'package:auth_with_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import '../data/prefs_keys.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    ///1) вызвыается initState, внутри него мы планируем вызов клбка после
    ///последнего кадра (addPostFrameCallback)
    // выполн один раз до билд метода
    super.initState();
    // позволяет вызывать код после билда
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(
        const Duration(seconds: 2),
        () => _checkAuth(), // вызываем функцию проверки
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/images/splash.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Try to find you...',
              style:
              TextStyle(fontSize: 22,),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            color: Colors.lightBlue,
            minHeight: 5,
          ),
        ],
      ),
    );
  }

  void _checkAuth() {
    // final email = prefs.getString(PrefsKeys.email); //достаем значения
    // final password = prefs.getString(PrefsKeys.password); //достаем значения
    // if (email != null &&
    //     email.isNotEmpty &&
    //     password != null &&
    //     password.isNotEmpty) {
    //   Navigator.pushReplacementNamed(context, '/profile');
    // } else {
    //   Navigator.pushReplacementNamed(context, '/auth');
    // }

    final currentUser = FirebaseService.currentUser;
    if (currentUser.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/profile');
    } else {
      Navigator.pushReplacementNamed(context, '/auth');
    }
  }
}
