import 'package:flutter/material.dart';
import 'package:moodymuch/screens/snakeinstructionscreen.dart';

import '../components/interactivetopbutton.dart';
import '../components/roundedrectanglebutton.dart';

class HappyScreen extends StatefulWidget {
  static const String id = 'happy_screen';
  const HappyScreen({Key? key}) : super(key: key);

  @override
  State<HappyScreen> createState() => _HappyScreenState();
}

class _HappyScreenState extends State<HappyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF78C2DB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 52,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 16.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const InteractiveTopButton(
                    imageResource: 'images/back_arrow.png'),
              ),
            ],
          ),
          const SizedBox(
            height: 52,
          ),
          const Image(
            image: AssetImage('images/happy_face.png'),
            height: 190,
            width: 190,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Happy',
            style: TextStyle(
              fontFamily: 'AvenirNextLTPro',
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFF263238),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            "Glad to see you're happy",
            style: TextStyle(
              fontFamily: 'AvenirNextLTPro',
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
          const Text(
            "Please try out our game!",
            style: TextStyle(
              fontFamily: 'AvenirNextLTPro',
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(
            height: 62,
          ),
          RoundedRectangleButton(
            displayName: 'Play a Game',
            color: const Color(0xEE032251),
            textColor: Colors.white,
            function: () {
              Navigator.popAndPushNamed(context, SnakeInstructionScreen.id);
            },
          )
        ],
      ),
    );
  }
}
