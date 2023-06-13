//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <android_phone_calls/android_phone_calls_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) android_phone_calls_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "AndroidPhoneCallsPlugin");
  android_phone_calls_plugin_register_with_registrar(android_phone_calls_registrar);
}
