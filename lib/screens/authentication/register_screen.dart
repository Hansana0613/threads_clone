import 'package:flutter/material.dart';
import 'package:threads_clone/utils/colors.dart';
import 'package:threads_clone/widgets/button.dart';
import 'package:threads_clone/widgets/text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

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
              children: [
                Container(height: MediaQuery.of(context).size.height * 0.1),
                Image.asset('assets/threads.png', height: 80),
                const SizedBox(height: 30),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: secondaryColor,
                      backgroundImage: const NetworkImage(
                        'https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100241.jpg?t=st=1746106395~exp=1746109995~hmac=649e1d51b963004d600f9d6305a8b12119ef07908386da53f480069068a5a91e&w=740',
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadiusDirectional.circular(30),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.yellow.shade600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                //email
                TextInputFeild(
                  controller: _emailController,
                  isPassword: false,
                  inputKeyboardType: TextInputType.emailAddress,
                  hintText: "Enter Email",
                ),
                const SizedBox(height: 30),
                //password
                TextInputFeild(
                  controller: _passwordController,
                  isPassword: true,
                  inputKeyboardType: TextInputType.emailAddress,
                  hintText: "Enter a Password",
                ),
                const SizedBox(height: 30),
                //username
                TextInputFeild(
                  controller: _usernameController,
                  isPassword: false,
                  inputKeyboardType: TextInputType.emailAddress,
                  hintText: "Enter a Username",
                ),
                const SizedBox(height: 30),
                //bio
                TextInputFeild(
                  controller: _bioController,
                  isPassword: false,
                  inputKeyboardType: TextInputType.emailAddress,
                  hintText: "Enter Bio",
                ),
                const SizedBox(height: 30),
                //submit button
                SubmitButton(
                  text: "Register",
                  onPressed: () {
                    // Handle registration logic here
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () { },
                      child: const Text(
                        "Log in",
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
