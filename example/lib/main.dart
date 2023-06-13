import 'package:flutter/material.dart';
import 'package:android_phone_calls/android_phone_calls.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _androidPhoneCallsPlugin = AndroidPhoneCalls();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  _androidPhoneCallsPlugin.requestPermissions();
                },
                child: const Text("Request Permissions"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
