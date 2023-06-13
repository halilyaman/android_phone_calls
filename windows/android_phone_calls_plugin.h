#ifndef FLUTTER_PLUGIN_ANDROID_PHONE_CALLS_PLUGIN_H_
#define FLUTTER_PLUGIN_ANDROID_PHONE_CALLS_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace android_phone_calls {

class AndroidPhoneCallsPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  AndroidPhoneCallsPlugin();

  virtual ~AndroidPhoneCallsPlugin();

  // Disallow copy and assign.
  AndroidPhoneCallsPlugin(const AndroidPhoneCallsPlugin&) = delete;
  AndroidPhoneCallsPlugin& operator=(const AndroidPhoneCallsPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace android_phone_calls

#endif  // FLUTTER_PLUGIN_ANDROID_PHONE_CALLS_PLUGIN_H_
