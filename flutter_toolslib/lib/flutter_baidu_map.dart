import 'dart:async';

import 'package:flutter/services.dart';

class FlutterBaiduMap {
  static const MethodChannel _channel =
      const MethodChannel('flutter_baidu_map');
  //注销定位资源
  static void disposeLocation() async{
    return await _channel.invokeMethod("disposeLocation");
  }
  //开始定位
  static Future<dynamic> startLocation() async{
    return await _channel.invokeMethod("startLocation");
  }
  //初始化定位
  static Future<bool> initLocation() async {
    _channel.setMethodCallHandler(handler);  //注意这里需要设置一下监听函数
    return await _channel.invokeMethod('initLocation');
  }

  static StreamController<String> _locationUpdateStreamController = new StreamController.broadcast();
  static Stream<String> get locationUpdate=>_locationUpdateStreamController.stream;

  static Future<dynamic> handler(MethodCall call) {
    String method = call.method;

    switch (method) {
      case "onLocation":
        {
          _locationUpdateStreamController.add( call.arguments );
        }
        break;
    }
    return new Future.value(_locationUpdateStreamController);
  }
}
