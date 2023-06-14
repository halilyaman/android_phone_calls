// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'android_phone_calls_platform_interface.dart';

/// A web implementation of the AndroidPhoneCallsPlatform of the AndroidPhoneCalls plugin.
class AndroidPhoneCallsWeb extends AndroidPhoneCallsPlatform {
  /// Constructs a AndroidPhoneCallsWeb
  AndroidPhoneCallsWeb();

  static void registerWith(Registrar registrar) {
    AndroidPhoneCallsPlatform.instance = AndroidPhoneCallsWeb();
  }
}
