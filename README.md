# android_phone_calls

The "android_phone_calls" Flutter plugin allows you to handle phone call events on the Android platform in your Flutter app.

## Features

- Detect incoming, outgoing, and missed calls
- Handle call states such as ringing, answered, and ended

## Usage

To use this plugin, follow these steps:

1. Add the "android_phone_calls" dependency to your `pubspec.yaml` file:

```yaml
dependencies:
     android_phone_calls: ^1.0.0
```

2. Import the package in your Dart code:

```dart
import 'package:android_phone_calls/android_phone_calls.dart';
```

3. Register the plugin in your Dart code:

```dart
AndroidPhoneCalls.registerPhoneCallListener();
```

4. Implement the necessary callbacks to handle phone call events:

```dart
AndroidPhoneCalls.addPhoneCallListener(
     onIncomingCall: (phoneNumber) {
       // Handle incoming call
     },
     onCallAnswered: () {
       // Handle call answered
     },
     onCallEnded: () {
       // Handle call ended
     },
     onMissedCall: () {
       // Handle missed call
     },
);
```

## Android Configuration

To enable the phone call event handling on the Android side, follow these steps:

1. Open the `AndroidManifest.xml` file located in the `android/app/src/main/` directory of your Flutter project.

2. Add the following receiver declaration inside the `<application>` tag:

```xml 
<receiver
   android:name="com.halilyaman.android_phone_calls.PhoneCallHandler"
   android:enabled="true"
   android:exported="true">
   <intent-filter>
       <action android:name="android.intent.action.PHONE_STATE" />
   </intent-filter>
</receiver>
```

This receiver declaration registers the `PhoneCallHandler` class to handle phone state events.

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the [Apache License 2.0](LICENSE).
