import 'package:best_flutter_ui_templates/design_login/login_screen.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<FirebaseUser> getuser() async {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user = await _auth.currentUser();
  print(user);
  return user;
}

class DesignLoginScreen extends StatefulWidget {
  @override
  _DesignLoginScreenState createState() => _DesignLoginScreenState();
}

class _DesignLoginScreenState extends State<DesignLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    Future<FirebaseUser> user = _auth.currentUser();
    return new FutureBuilder<FirebaseUser>(
      future: user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          return Scaffold(body: NavigationHomeScreen());
        } else
          return Scaffold(
            body: LoginScreen(),
          );
      },
    );
  }
}
