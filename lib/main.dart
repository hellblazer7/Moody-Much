import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moodymuch/screens/camerascreen.dart';
import 'package:moodymuch/screens/gatewayscreen.dart';
import 'package:moodymuch/screens/happyscreen.dart';
import 'package:moodymuch/screens/homescreen.dart';
import 'package:moodymuch/screens/instructionscreen.dart';
import 'package:moodymuch/screens/loginscreen.dart';
import 'package:moodymuch/screens/angryscreen.dart';
import 'package:moodymuch/screens/memescreen.dart';
import 'package:moodymuch/screens/signupscreen.dart';
import 'package:moodymuch/screens/snakeinstructionscreen.dart';
import 'package:moodymuch/screens/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.last;
  await Firebase.initializeApp();
  runApp(MyApp(cameraDescription: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription cameraDescription;
  const MyApp({super.key, required this.cameraDescription});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        GatewayScreen.id: (context) => const GatewayScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        CameraScreen.id: (context) => CameraScreen(
              camera: cameraDescription,
            ),
        AngryScreen.id: (context) => const AngryScreen(),
        HappyScreen.id: (context) => const HappyScreen(),
        MemeScreen.id: (context) => const MemeScreen(),
        SnakeInstructionScreen.id: (context) => const SnakeInstructionScreen(),
        InstructionScreen.id: (context) => const InstructionScreen(),
      },
    );
  }
}
