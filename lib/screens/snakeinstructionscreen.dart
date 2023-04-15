import 'package:flutter/material.dart';

import '../components/interactivetopbutton.dart';

class SnakeInstructionScreen extends StatefulWidget {
  static const String id = 'snake_instruction_screen';
  const SnakeInstructionScreen({Key? key}) : super(key: key);

  @override
  State<SnakeInstructionScreen> createState() => _SnakeInstructionScreenState();
}

class _SnakeInstructionScreenState extends State<SnakeInstructionScreen> {
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
            'Snake Game Instructions',
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
                'images/snake_game.webp',
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
              "1. Control a snake to eat food and grow longer while avoiding collisions with the snake's own body and screen edges.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 15,
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
              "2. Use directional controls to guide the snake's movement, such as up, down, left, or right.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 15,
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
              "3. Collisions with the snake's own body or screen edges result in game over, with an option to restart.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 15,
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
              "4. Aim to achieve a high score by eating as much food as possible and surviving as long as you can without collisions.",
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
