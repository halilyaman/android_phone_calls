#include "include/android_phone_calls/android_phone_calls_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "android_phone_calls_plugin.h"

void AndroidPhoneCallsPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  android_phone_calls::AndroidPhoneCallsPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
