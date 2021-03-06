import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:best_flutter_ui_templates/items/ButtonBox.dart';
import 'package:best_flutter_ui_templates/items/Textbox.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final Color primaryColor = Color(0xFF4aa0d5);
  final Color backgroundColor = Colors.white;
  final AssetImage backgroundImage = new AssetImage("assets/images/logo.png");
  final _email = TextEditingController(), _password = TextEditingController();
  final _name = TextEditingController(),
      _confirmpassword = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          opacity: 0.3,
          progressIndicator: SpinKitFadingCircle(
            size: 50,
            color: AppTheme.grey,
          ),
          inAsyncCall: _loading,
          child: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: this.backgroundColor,
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: new ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                          image: this.backgroundImage,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: this.primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Name",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                TextBox(
                    controller: _name,
                    hintText: 'Enter your name',
                    isPassword: false),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Email",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                TextBox(
                    controller: _email,
                    hintText: 'Enter your Email',
                    isPassword: false),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Password",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                TextBox(
                    controller: _password,
                    hintText: 'Enter your password',
                    isPassword: true),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Confirm Password",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                TextBox(
                    controller: _confirmpassword,
                    hintText: 'Enter your password',
                    isPassword: true),
                ButtonBox(
                  primaryColor: primaryColor,
                  onPressed: () async {
                    try {
                      setState(() {
                        _loading = true;
                      });
                      print('lol');
                      print(_email.text);
                      print(_password.text);
                      final FirebaseUser user =
                          (await _auth.createUserWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      ))
                              .user;
                      print(user);

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              NavigationHomeScreen()));
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      _loading = false;
                    });
                  },icon: FaIcon(
                    Icons.arrow_forward,
                    color: this.primaryColor,
                  ),
                  text: 'LOGIN',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height * 0.85);
    p.arcToPoint(
      Offset(0.0, size.height * 0.85),
      radius: const Radius.elliptical(50.0, 10.0),
      rotation: 0.0,
    );
    p.lineTo(0.0, 0.0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
