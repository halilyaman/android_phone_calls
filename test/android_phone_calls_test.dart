import 'package:flutter_test/flutter_test.dart';
import 'package:android_phone_calls/android_phone_calls.dart';
import 'package:android_phone_calls/android_phone_calls_platform_interface.dart';
import 'package:android_phone_calls/android_phone_calls_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidPhoneCallsPlatform
    with MockPlatformInterfaceMixin
    implements AndroidPhoneCallsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidPhoneCallsPlatform initialPlatform = AndroidPhoneCallsPlatform.instance;

  test('$MethodChannelAndroidPhoneCalls is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidPhoneCalls>());
  });

  test('getPlatformVersion', () async {
    AndroidPhoneCalls androidPhoneCallsPlugin = AndroidPhoneCalls();
    MockAndroidPhoneCallsPlatform fakePlatform = MockAndroidPhoneCallsPlatform();
    AndroidPhoneCallsPlatform.instance = fakePlatform;

    expect(await androidPhoneCallsPlugin.getPlatformVersion(), '42');
  });
}
