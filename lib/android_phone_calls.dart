
import 'android_phone_calls_platform_interface.dart';

class AndroidPhoneCalls {
  Future<void> requestPermissions() {
    return AndroidPhoneCallsPlatform.instance.requestPermissions();
  }

  Future<bool> checkPermissions() async {
    final result = await AndroidPhoneCallsPlatform.instance.checkPermissions();
    return result == true;
  }
}
