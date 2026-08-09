import 'package:flutter/material.dart';
import '../data/models/networkmodel.dart';

class NetworksList extends StatelessWidget {
  const NetworksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Networks', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
    );
  }
}
