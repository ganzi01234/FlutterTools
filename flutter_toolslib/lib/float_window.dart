
import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class FloatWindow {
  static const MethodChannel _channel =
      const MethodChannel('float_window');

  static Future<String> StartFlowWindow() async {
    var result = await _channel.invokeMethod("startFloatWindow");
    return result;
  }
}
