import 'package:auth_with_firebase/data/prefs_keys.dart';
import 'package:auth_with_firebase/main.dart';
import 'package:auth_with_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final firstNameTec = TextEditingController();
  final lastNameTec = TextEditingController();
  final emailTec = TextEditingController();
  final passwordTec = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.teal[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/images/none_avatar.png'),),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: firstNameTec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
                    labelText: 'First name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: lastNameTec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
                    labelText: 'Last name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailTec,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
                    labelText: 'E-mail',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child:  TextField(
                  obscureText: true,
                  controller: passwordTec,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),),
                    labelText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 100,),
              ElevatedButton(
                onPressed: () => _onCreatePressed(context),
                style: ElevatedButton.styleFrom(shape: StadiumBorder(),
                    fixedSize: Size(100, 40), backgroundColor: Colors.black),
                child: const Text('SIGN UP'),
              ),
            ],
          ),
        ),
      ),
    ),);
  }

  Future<void> _onCreatePressed(BuildContext context) async { // объявили ассинхр фун-ю
    await prefs.setString(PrefsKeys.firstName, firstNameTec.text); //save data in Sh.pr.
    await prefs.setString(PrefsKeys.lastName, lastNameTec.text);
    // await prefs.setString(PrefsKeys.email, emailTec.text);
    // await prefs.setString(PrefsKeys.password, passwordTec.text);
    // Navigator.pop(context);

    final success = await FirebaseService.signUp(emailTec.text, passwordTec.text);
    if (success) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Something went wrong'),
        ),
      );
    }
  }
}

