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

  String callState = "No Call";

  @override
  void initState() {
    super.initState();
    AndroidPhoneCalls.addPhoneCallListener(
      onIncomingCall: (phone, name) {
        setState(() {
          callState = "phone: $phone, name: $name";
        });
      },
      onCallAnswered: () {
        setState(() {
          callState = "Call answered";
        });
      },
      onCallEnded: () {
        setState(() {
          callState = "Call ended";
        });
      },
      onMissedCall: () {
        setState(() {
          callState = "Missed call";
        });
      },
    );
  }

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
                  AndroidPhoneCalls.requestPermissions();
                },
                child: const Text("Request Permissions"),
              ),
              const Spacer(),
              Text(callState),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
