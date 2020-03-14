import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/design_login/sign_up.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:best_flutter_ui_templates/items/ButtonBox.dart';
import 'package:best_flutter_ui_templates/items/Textbox.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final Color primaryColor = Color(0xFF4aa0d5);
  final Color backgroundColor = Colors.white;
  final AssetImage backgroundImage = new AssetImage("assets/images/logo.png");
  final _email = TextEditingController(), _password = TextEditingController();
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
                          fit: BoxFit.fill,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(top: 150.0, bottom: 100.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "DEMO",
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: this.primaryColor),
                          ),
                          Text(
                            "Login Screen ",
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
                ButtonBox(
                  primaryColor: primaryColor,
                  onPressed: () async {
                    try {
                      setState(() {
                        _loading = true;
                      });
                      print(_email.text);
                      print(_password.text);
                      final FirebaseUser user =
                          (await _auth.signInWithEmailAndPassword(
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
                  },
                  text: 'LOGIN',
                  icon: FaIcon(
                    Icons.arrow_forward,
                    color: primaryColor,
                  ),
                ),
                ButtonBox(
                  primaryColor: Color(0xFF3B5998),
                  onPressed: () {},
                  text: "LOGIN WITH FACEBOOK",
                  icon: FaIcon(
                    FontAwesomeIcons.facebookF,
                    color: primaryColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 0.0),
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            alignment: Alignment.center,
                            child: Text(
                              "DON'T HAVE AN ACCOUNT?",
                              style: TextStyle(color: this.primaryColor),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        SignUpScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
