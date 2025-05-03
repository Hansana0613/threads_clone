import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:threads_clone/responsive/mobile_screen_layout.dart';
import 'package:threads_clone/responsive/renponsive_layout_screen.dart';
import 'package:threads_clone/responsive/web_screen_layout.dart';
import 'package:threads_clone/screens/authentication/register_screen.dart';
import 'package:threads_clone/utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // check wheather the app is running on web or mobile
  if (kIsWeb) {
    // Initialize Firebase for web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyC9gRt5JqMlcyKoL1w8Zwyso8XllJIoKtw",
        authDomain: "test-applications-34767.firebaseapp.com",
        projectId: "test-applications-34767",
        storageBucket: "test-applications-34767.firebasestorage.app",
        messagingSenderId: "325529031919",
        appId: "1:325529031919:web:28b3e3279a6398ec93b71a",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      debugShowCheckedModeBanner: false,
      title: "Threads Clone",
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: const RegisterScreen(),
    );
  }
}
