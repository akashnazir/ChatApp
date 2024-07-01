// ignore_for_file: avoid_print

import 'package:demo_app/services/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //SignIn Method
  void signIn() {
    // ignore: unused_local_variable
    final authService = Provider.of<AuthService>(context, listen: false);
    
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                //Logo
                Icon(
                  Icons.message,
                  size: 150,
                  color: Colors.grey[800],
                ),

                // Wellcome back message
                const SizedBox(
                  height: 35,
                ),
                const Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyle(fontSize: 16),
                ),

                //Email Textfield
                const SizedBox(
                  height: 50,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),

                //Password Textfield
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Password',
                    obscureText: true),

                //signin button
                const SizedBox(
                  height: 50,
                ),
                MyButton(onTap: signIn, text: 'Sign in'),

                //Not a member? Register Now
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not a member?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const RegistrationPage()));
                      },
                      child: const Text(
                        "Register Now",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
