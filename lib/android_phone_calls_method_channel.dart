import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_phone_calls_platform_interface.dart';

/// An implementation of [AndroidPhoneCallsPlatform] that uses method channels.
class MethodChannelAndroidPhoneCalls extends AndroidPhoneCallsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_phone_calls');

  @override
  Future<bool?> requestPermissions() {
    return methodChannel.invokeMethod<bool>('requestPermissions');
  }

  @override
  Future<bool?> checkPermissions() {
    return methodChannel.invokeMethod<bool>('checkPermissions');
  }

  @override
  void addPhoneCallListener({
    void Function(String?, String?)? onIncomingCall,
    void Function()? onCallAnswered,
    void Function()? onCallEnded,
    void Function()? onMissedCall,
  }) {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == "onIncomingCall") {
        final arguments = call.arguments;
        onIncomingCall?.call(arguments["phoneNumber"], arguments["callerName"]);
      } else if (call.method == "onCallAnswered") {
        onCallAnswered?.call();
      } else if (call.method == "onCallEnded") {
        onCallEnded?.call();
      } else if (call.method == "onMissedCall") {
        onMissedCall?.call();
      }
    });
  }
}
