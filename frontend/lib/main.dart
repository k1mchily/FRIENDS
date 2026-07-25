import 'package:flutter/material.dart';
import 'package:pocketbase/pocketbase.dart';

// PocketBase client - global instance
late PocketBase pb;

// Backend URL
/*
'http://127.0.0.1:8090' - Windows
'http://localhost:8090' - Mac/Linux
'http://<your-ip>:8090' - Mobile devices (replace <your-ip> with your machine's IP address)
*/

const String backendUrl = 'http://127.0.0.1:8090';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize PocketBase client

  pb = PocketBase(backendUrl);

  // Auto-refresh authentication token if available

  try {
    if (pb.authStore.isValid) {
      await pb.collection('users').authRefresh();
    }
  } catch (e) {
    debugPrint('Auto-refresh failed: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FRIENDS',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo.shade900),

        useMaterial3: true,

        fontFamily: 'Roboto',
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isConnected = false;

  String _statusMessage = 'Connecting to PocketBase...';

  @override
  void initState() {
    super.initState();

    _checkPocketBaseConnection();
  }

  Future<void> _checkPocketBaseConnection() async {
    try {
      // Test the connection to PocketBase

      final healthCheck = await pb.health.check();

      setState(() {
        _isConnected = true;

        _statusMessage = 'Connected to PocketBase';
      });

      debugPrint('PocketBase Health: ${healthCheck.toString()}');
    } catch (e) {
      setState(() {
        _isConnected = false;

        _statusMessage = 'Error: ${e.toString()}';
      });

      debugPrint('PocketBase Connection Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: _isConnected ? Colors.green.shade50 : Colors.red.shade50,
              ),

              child: Column(
                children: [
                  Icon(
                    _isConnected ? Icons.done_all : Icons.clear,

                    size: 48,

                    color: _isConnected ? Colors.green : Colors.red,
                  ),

                  const SizedBox(height: 8),

                  Text(
                    _statusMessage,

                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,

                      fontSize: 24,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    backendUrl,

                    textAlign: TextAlign.center,

                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade700,

                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
