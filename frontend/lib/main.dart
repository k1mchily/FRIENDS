import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

final pb = PocketBase('http://127.0.0.1:8090');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World');
  }

  Future<String> testPocketBase() async {
    try {
      final response = await pb.collection('users').getList();
      return 'Success: ${response.items.length} users found.';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
