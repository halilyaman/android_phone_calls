import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_phone_calls/android_phone_calls_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidPhoneCalls platform = MethodChannelAndroidPhoneCalls();
  const MethodChannel channel = MethodChannel('android_phone_calls');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
