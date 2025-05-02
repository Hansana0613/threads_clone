import 'package:flutter/material.dart';
import 'package:threads_clone/screens/authentication/register_screen.dart';
import 'package:threads_clone/widgets/button.dart';
import 'package:threads_clone/widgets/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.3),
                Image.asset('assets/threads.png', height: 80),
                const SizedBox(height: 30),
                TextInputFeild(
                  controller: _emailController,
                  hintText: 'Enter Email',
                  inputKeyboardType: TextInputType.emailAddress,
                  isPassword: false,
                ),
                const SizedBox(height: 30),
                //password
                TextInputFeild(
                  controller: _passwordController,
                  hintText: 'Enter Password',
                  inputKeyboardType: TextInputType.emailAddress,
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                SubmitButton(onPressed: () {}, text: 'Log in'),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
