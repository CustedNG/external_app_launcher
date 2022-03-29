
import 'dart:async';

import 'package:flutter/services.dart';

class ExternalAppLauncher2 {
  static const MethodChannel _channel = MethodChannel('external_app_launcher2');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// Function to launch the external app
  static Future<bool> openApp(String urlScheme) async {
    if (urlScheme.isEmpty) {
      throw Exception('The [urlScheme] can not be empty');
    }

    return await _channel.invokeMethod('openApp', {
      'urlScheme': urlScheme,
    });
  }
}
