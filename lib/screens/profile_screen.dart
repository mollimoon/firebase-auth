import 'package:auth_with_firebase/data/prefs_keys.dart';
import 'package:auth_with_firebase/main.dart';
import 'package:auth_with_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _name = prefs.getString(PrefsKeys.firstName);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'assets/images/avatar.png',
                      width: 120,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Привет, $_name !",
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text(
                      'Name: ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prefs.getString(PrefsKeys.firstName) ?? '',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text(
                      'Last name: ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      prefs.getString(PrefsKeys.lastName) ?? '',
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Text(
                      'E-mail: ',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      FirebaseService.currentUser,
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
              Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () async {
                    await FirebaseService.logout();
                    Navigator.pushNamed(
                      context,
                      '/auth',
                    );
                    prefs.clear();
                  },
                  child: const Text("Log out"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
