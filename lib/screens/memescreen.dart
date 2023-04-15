import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:moodymuch/components/roundedrectanglebutton.dart';
import 'package:moodymuch/screens/snakeinstructionscreen.dart';

import '../components/interactivetopbutton.dart';

class MemeScreen extends StatefulWidget {
  static const String id = 'meme_screen';
  const MemeScreen({Key? key}) : super(key: key);

  @override
  State<MemeScreen> createState() => _MemeScreenState();
}

class _MemeScreenState extends State<MemeScreen> {
  String memeURL = '';
  bool loading = true;
  @override
  void initState() {
    DatabaseReference memeURLRef = FirebaseDatabase.instance.ref('memeURL');
    memeURLRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        memeURL = data.toString();
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              'Meme Of The Day',
              style: TextStyle(
                fontFamily: 'AvenirNextLTPro',
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Color(0xFF263238),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  child: loading
                      ? const Image(
                          image: AssetImage('images/waiting_meme.jpg'),
                          height: 300,
                          width: 300,
                        )
                      : Image(
                          image: NetworkImage(memeURL),
                          height: 300,
                          width: 300,
                        ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: RoundedRectangleButton(
                function: () {
                  Navigator.popAndPushNamed(context, SnakeInstructionScreen.id);
                },
                displayName: 'Play Snake Game',
                color: const Color(0xFF636090),
                textColor: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: RoundedRectangleButton(
                function: () {
                  Navigator.pop(context);
                },
                displayName: 'No Thanks',
                color: const Color(0x4AB1AECC),
                textColor: const Color(0xFF49525B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
