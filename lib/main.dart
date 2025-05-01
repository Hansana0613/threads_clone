import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:threads_clone/screens/authentication/register_screen.dart';
import 'package:threads_clone/utils/colors.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: RegisterScreen(),
    );
  }
}
