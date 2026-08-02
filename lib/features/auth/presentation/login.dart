import 'package:flutter/material.dart';
import '../../../widgets/text_field.dart';
import '../../../widgets/button.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

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
            padding: const EdgeInsets.symmetric(horizontal: 350.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login
                Text(
                  'Log In',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
                // Welcome back
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

                const SizedBox(height: 10),

                // Password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Login Button
                MyButton(
                  onTap: () {
                    // login logic
                  },
                  text: 'Log In',
                ),

                // Don't have an account? Sign Up
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
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
