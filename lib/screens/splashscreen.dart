import 'package:flutter/material.dart';
import 'package:moodymuch/screens/gatewayscreen.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF636090),
      body: GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, GatewayScreen.id);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/app_logo_splash.png'),
              height: 125,
              width: 125,
            ),
            SizedBox(
              height: 32.0,
            ),
            Center(
              child: Text(
                'Moody Much',
                style: TextStyle(
                  fontFamily: 'AvenirNextLTPro',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
