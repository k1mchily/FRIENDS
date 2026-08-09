import 'package:flutter/material.dart';
import 'package:frontend/features/auth/logic/login_or_register.dart';
import 'features/server/presentation/networkslist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FRIENDS',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: NetworksList(
        onNetworkSelected: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginOrRegister())
          )
        }
      ),
    );
  }
}
