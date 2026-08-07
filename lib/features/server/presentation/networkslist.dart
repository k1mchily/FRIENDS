import 'package:flutter/material.dart';
import '../data/models/networkitem.dart';

class NetworksList extends StatefulWidget {
  final List<NetworkItem> networks = const [
    NetworkItem(name: 'Goofy Ahh', host: 'https://goofyahh.com', port: '6767'),
  ];

  const NetworksList({super.key});

  @override
  State<NetworksList> createState() => _NetworksListState();
}

class _NetworksListState extends State<NetworksList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Networks', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color(0xFFF9FAFB),
      ),
    );
  }
}
