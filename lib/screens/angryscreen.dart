import 'package:flutter/material.dart';
import 'package:moodymuch/components/roundedrectanglebutton.dart';
import 'package:moodymuch/screens/memescreen.dart';
import 'package:moodymuch/screens/snakeinstructionscreen.dart';

import '../components/interactivetopbutton.dart';

class AngryScreen extends StatefulWidget {
  static const String id = 'mood_screen';
  const AngryScreen({Key? key}) : super(key: key);

  @override
  State<AngryScreen> createState() => _AngryScreenState();
}

class _AngryScreenState extends State<AngryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAB4747),
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
            image: AssetImage('images/angry_face.png'),
            height: 190,
            width: 190,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Sad',
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
            "Don't Worry",
            style: TextStyle(
              fontFamily: 'AvenirNextLTPro',
              fontSize: 21.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ),
          const Text(
            "We'll try improving your mood!",
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
            displayName: 'Start',
            color: const Color(0xEE5B0D0D),
            textColor: Colors.white,
            function: () {
              Navigator.popAndPushNamed(context, MemeScreen.id);
            },
          )
        ],
      ),
    );
  }
}
