
import 'android_phone_calls_platform_interface.dart';

class AndroidPhoneCalls {
  const AndroidPhoneCalls._();

  static Future<void> requestPermissions() {
    return AndroidPhoneCallsPlatform.instance.requestPermissions();
  }

  static Future<bool?> checkPermissions() async {
    return await AndroidPhoneCallsPlatform.instance.checkPermissions();
  }

  static void addPhoneCallListener({
    void Function(String? phoneNumber, String? callerName)? onIncomingCall,
    void Function()? onCallAnswered,
    void Function()? onCallEnded,
    void Function()? onMissedCall,
  }) {
    AndroidPhoneCallsPlatform.instance.addPhoneCallListener(
      onIncomingCall: onIncomingCall,
      onCallAnswered: onCallAnswered,
      onCallEnded: onCallEnded,
      onMissedCall: onMissedCall,
    );
  }

  static Future<String?> getDialerPackageName() {
    return AndroidPhoneCallsPlatform.instance.getDialerPackageName();
  }
}
