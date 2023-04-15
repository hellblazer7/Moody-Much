import 'package:flutter/material.dart';

import '../components/interactivetopbutton.dart';

class InstructionScreen extends StatelessWidget {
  static const String id = 'instruction_screen';
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD1CFDF),
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
            height: 20,
          ),
          const Text(
            'About Moody Much',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'AvenirNextLTPro',
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFF263238),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            child: Image(
              image: AssetImage(
                'images/wormies_video_call.png',
              ),
              height: 250,
              width: 250,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "We aim to improve your mood by showing funny memes and setting up the iconic Snake Game.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Check your mood by using the Mood Detection Feature.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: Text(
              "Listen to our featured Spotify Playlist that features famous songs that improve your mood!",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
