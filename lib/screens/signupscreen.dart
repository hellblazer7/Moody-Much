import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moodymuch/components/roundedrectanglebutton.dart';
import 'package:moodymuch/screens/homescreen.dart';

import '../components/moodymuchtextfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  bool emailValidator = true;
  bool nameValidator = true;
  bool passwordValidator = true;
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');
  Future<void> addUserData() async {
    await ref.set({
      name: {
        'Email': email,
        'Password': password,
      }
    });
  }

  Future<bool> signUpFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    }
    return false;
  }

  bool validatePassword(String value) {
    if (!(value.length > 7) && value.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool validateName(String value) {
    if (value.isNotEmpty) {
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
              'Sign Up',
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
                    'Already have an account?',
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
                    ' Sign In',
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
              validator: nameValidator,
              label: 'Name',
              onSubmit: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(
              height: 25.0,
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
              height: 190,
            ),
            Center(
              child: RoundedRectangleButton(
                displayName: 'Done',
                color: const Color(0xFF636090),
                textColor: Colors.white,
                function: () async {
                  if (validateName(name) ||
                      validatePassword(password) ||
                      validateEmail(email)) {
                    await addUserData();
                    if (await signUpFirebase()) {
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
                  if (!validateName(name)) {
                    setState(() {
                      nameValidator = false;
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
