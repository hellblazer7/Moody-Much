import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:moodymuch/screens/camerascreen.dart';

import '../components/interactivetopbutton.dart';
import '../components/roundedrectanglebutton.dart';
import 'happyscreen.dart';
import 'homescreen.dart';
import 'angryscreen.dart';

class ConfirmPhotoScreen extends StatefulWidget {
  static const String id = 'confirm_photo';
  final String imagePath;
  const ConfirmPhotoScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  State<ConfirmPhotoScreen> createState() => _ConfirmPhotoScreenState();
}

class _ConfirmPhotoScreenState extends State<ConfirmPhotoScreen> {
  final faceDetector =
      FaceDetector(options: FaceDetectorOptions(enableClassification: true));
  double? isSmiling = 0.0;
  Future<void> getImage() async {
    final inputImage = InputImage.fromFilePath(widget.imagePath);
    final List<Face> faces = await faceDetector.processImage(inputImage);
    for (Face face in faces) {
      if (face.smilingProbability != null) {
        final double? smileProb = face.smilingProbability;
        setState(() {
          isSmiling = smileProb;
          print(isSmiling);
        });
      }
    }
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0x4AB1AECC),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const InteractiveTopButton(
                              imageResource: 'images/back_arrow.png'),
                        ),
                        const Expanded(
                          child: SizedBox(
                            height: 42,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        child: Image.file(
                          File(widget.imagePath),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90.0),
                        child: RoundedRectangleButton(
                          displayName: 'Done',
                          color: const Color(0xFF636090),
                          textColor: Colors.white,
                          function: () {
                            if (isSmiling! > 0.6) {
                              Navigator.popAndPushNamed(
                                  context, HappyScreen.id);
                            } else {
                              Navigator.popAndPushNamed(
                                  context, AngryScreen.id);
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
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
                  const Image(
                    image: AssetImage('images/game_taskbar.png'),
                    height: 25,
                    width: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    },
                    child: const Image(
                      image: AssetImage('images/home_taskbar.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const Image(
                    image: AssetImage('images/profile_taskbar.png'),
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
