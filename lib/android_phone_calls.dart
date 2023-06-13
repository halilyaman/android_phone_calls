
import 'android_phone_calls_platform_interface.dart';

class AndroidPhoneCalls {
  Future<String?> getPlatformVersion() {
    return AndroidPhoneCallsPlatform.instance.getPlatformVersion();
  }
}
