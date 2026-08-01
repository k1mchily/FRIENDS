import 'package:flutter/material.dart';
import '../../../widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xF9FAFBFF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                // Register
                Text(
                  'Register',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                // Welcome back!
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),
                // Email
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                // Password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                // Login Button

                // Don't have an account? Sign Up
              ],
            ),
          ),
        ),
      ),
    );
  }
}
