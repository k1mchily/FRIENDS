import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';
import 'features/auth/presentation/login.dart';

final pb = PocketBase('http://127.0.0.1:8090');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
