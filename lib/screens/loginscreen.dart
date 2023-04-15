import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moodymuch/screens/homescreen.dart';

import '../components/moodymuchtextfield.dart';
import '../components/roundedrectanglebutton.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool emailValidator = true;
  bool passwordValidator = true;

  Future<bool> loginFirebase() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
    return false;
  }

  bool validatePassword(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool validateEmail(String value) {
    if (value.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 110,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 30,
                color: Color(0xFF49525B),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Text(
                    "Don't have an account?",
                    style: TextStyle(
                      fontFamily: 'AvenirNextLTPro',
                      fontSize: 17,
                      color: Color(0xFF49525B),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      fontFamily: 'AvenirNextLTPro',
                      fontSize: 17,
                      color: Color(0xFF49525B),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            MoodyMuchTextField(
              validator: emailValidator,
              label: 'Email',
              onSubmit: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(
              height: 25.0,
            ),
            MoodyMuchTextField(
              validator: passwordValidator,
              label: 'Password',
              onSubmit: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(
              height: 255,
            ),
            Center(
              child: RoundedRectangleButton(
                displayName: 'Done',
                color: const Color(0xFF636090),
                textColor: Colors.white,
                function: () async {
                  if (validatePassword(password) || validateEmail(email)) {
                    if (await loginFirebase()) {
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    }
                  }
                  if (!validateEmail(email)) {
                    setState(() {
                      emailValidator = false;
                    });
                  }
                  if (!validatePassword(password)) {
                    setState(() {
                      passwordValidator = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
