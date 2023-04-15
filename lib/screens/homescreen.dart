import 'package:flutter/material.dart';
import 'package:moodymuch/screens/camerascreen.dart';
import 'package:moodymuch/screens/instructionscreen.dart';
import 'package:moodymuch/screens/memescreen.dart';
import 'package:moodymuch/screens/snakeinstructionscreen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/homescreenrowwidget.dart';
import '../components/interactivetopbutton.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  launchPlaylist() async {
    final spotifyUrl = Uri.parse(
        'https://www.youtube.com/playlist?list=PLAiZNfJpSs62CZgvoWBmqoEK1o7DNdGwj');
    if (await canLaunchUrl(spotifyUrl)) {
      await launchUrl(spotifyUrl);
    } else {
      // can't launch url
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 56,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 42,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, InstructionScreen.id);
                  },
                  child: const InteractiveTopButton(
                    imageResource: 'images/question_mark.png',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Container(
                height: 257,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF636090),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Welcome to Moody Much!',
                        style: TextStyle(
                          fontFamily: 'AvenirNextLTPro',
                          color: Colors.white,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      const Text(
                        'Track your mood and',
                        style: TextStyle(
                          fontFamily: 'AvenirNextLTPro',
                          color: Colors.white,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: 7.0,
                      ),
                      const Text(
                        'boost your day',
                        style: TextStyle(
                          fontFamily: 'AvenirNextLTPro',
                          color: Colors.white,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: SizedBox(
                              height: 120,
                            ),
                          ),
                          Image(
                            image: AssetImage('images/wormies_welcome.png'),
                            height: 120,
                            width: 80,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeScreenRowWidget(
                    function: () {
                      Navigator.popAndPushNamed(context, CameraScreen.id);
                    },
                    title: 'Mood Detection',
                    color: const Color(0xEEEB9481),
                    contentLine1: 'Check your',
                    contentLine2: 'Mood now',
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  HomeScreenRowWidget(
                    function: () {
                      launchPlaylist();
                    },
                    title: 'Songs',
                    color: const Color(0xEE89DAA6),
                    contentLine1: 'Listen to our',
                    contentLine2: 'Spotify Playlist',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeScreenRowWidget(
                    function: () {
                      Navigator.pushNamed(context, SnakeInstructionScreen.id);
                    },
                    title: 'Snake Game',
                    color: const Color(0xEEE6BE90),
                    contentLine1: 'Play the Iconic',
                    contentLine2: 'Snake Game',
                  ),
                  const SizedBox(
                    width: 7.0,
                  ),
                  HomeScreenRowWidget(
                    function: () {
                      Navigator.pushNamed(context, MemeScreen.id);
                    },
                    title: 'Memes',
                    color: const Color(0xEE5C8CB4),
                    contentLine1: 'Look at the',
                    contentLine2: 'Meme Of The Day',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 63,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF636090),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, CameraScreen.id);
                    },
                    child: const Image(
                      image: AssetImage('images/emotion_taskbar.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SnakeInstructionScreen.id);
                    },
                    child: const Image(
                      image: AssetImage('images/game_taskbar.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const Image(
                    image: AssetImage('images/home_taskbar.png'),
                    height: 25,
                    width: 25,
                  ),
                  const Image(
                    image: AssetImage('images/profile_taskbar.png'),
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
