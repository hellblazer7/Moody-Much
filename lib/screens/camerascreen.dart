import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:moodymuch/screens/confirmphotoscreen.dart';
import 'package:moodymuch/screens/homescreen.dart';
import '../components/interactivetopbutton.dart';
import '../components/roundedrectanglebutton.dart';
import 'instructionscreen.dart';

class CameraScreen extends StatefulWidget {
  static const String id = 'camera_screen';
  final CameraDescription camera;
  const CameraScreen({Key? key, required this.camera}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
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
                          height: 42.0,
                          width: 16.0,
                        ),
                        const Image(
                          image: AssetImage(
                            'images/app_logo.png',
                          ),
                          height: 42,
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Mood Detection',
                              style: TextStyle(
                                fontFamily: 'AvenirNextLTPro',
                                fontSize: 24.0,
                                color: Color(0xFF49525B),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
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
                        const SizedBox(
                          width: 8.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: FutureBuilder<void>(
                          future: _initializeControllerFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              // If the Future is complete, display the preview.
                              return ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                  ),
                                  child: CameraPreview(_controller));
                            } else {
                              // Otherwise, display a loading indicator.
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 70.0),
                        child: RoundedRectangleButton(
                          displayName: 'Take Picture',
                          color: const Color(0xFF636090),
                          textColor: Colors.white,
                          function: () async {
                            try {
                              // Ensure that the camera is initialized.
                              await _initializeControllerFuture;

                              // Attempt to take a picture and then get the location
                              // where the image file is saved.
                              final image = await _controller.takePicture();
                              print(image.path);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmPhotoScreen(imagePath: image.path),
                                ),
                              );
                            } catch (e) {
                              // If an error occurs, log the error to the console.
                              print(e);
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
                  const Image(
                    image: AssetImage('images/emotion_taskbar.png'),
                    height: 25,
                    width: 25,
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
