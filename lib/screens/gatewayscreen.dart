import 'package:flutter/material.dart';
import 'package:moodymuch/screens/loginscreen.dart';
import 'package:moodymuch/screens/signupscreen.dart';

import '../components/roundedrectanglebutton.dart';

class GatewayScreen extends StatelessWidget {
  static const String id = 'gateway_screen';
  const GatewayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 125,
            ),
            const Center(
              child: Image(
                image: AssetImage('images/wormies_celebration.png'),
                height: 223,
                width: 325,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 20.0,
                  color: Color(0xFF49525B),
                ),
              ),
            ),
            const Text(
              'We hope you have a good day!',
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 20.0,
                color: Color(0xFF49525B),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Get Started with Moody Much',
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 20.0,
                color: Color(0xFF49525B),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedRectangleButton(
              color: const Color(0xFF636090),
              function: () {
                Navigator.pushNamed(context, SignUpScreen.id);
              },
              displayName: 'Sign Up',
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 17.0,
            ),
            RoundedRectangleButton(
              displayName: 'Log In',
              color: const Color(0x4AB1AECC),
              textColor: const Color(0xFF49525B),
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
