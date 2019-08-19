import 'package:flutter/material.dart';
import 'package:flutter_tools/model/function.dart';
import 'package:flutter_tools/pages/image_picker/image_picker_page.dart';
import 'package:flutter_tools/pages/web_page/web_view_page.dart';
import 'package:flutter_tools/pages/alipay_page/alipay_page.dart';
import 'package:flutter_tools/pages/asrt/asrt_page.dart';
import 'package:flutter_tools/pages/qr_barcode_page/qr_barcode_page.dart';
import 'package:flutter_tools/pages/baidu_page/map_page.dart';
import 'package:flutter_tools/pages/wechat_page/wechat_page.dart';
import 'package:flutter_tools/pages/download_page/download_page.dart';
import 'package:flutter_tools/pages/admob_page/admob_page.dart';
import 'dart:core';

class Constants {
  static List<Func> first_page_function;
  static const String arst_desc =  '''
                        ASRTGitHub:https://github.com/nl8590687/ASRT_SpeechRecognition
                        在ASRT基础上进行Flutter改进，实现android手机上的语音录制，并且传送语音wav文件到服务端识别。''';

  static const String image_pick_desc =  '''
                        GitHub:https://github.com/flutter/plugins/tree/master/packages/image_picker
                        使用了image_picker的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                                image_picker: ^0.6.1
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                              import 'package:image_picker/image_picker.dart'; ''';

  static const String webview_desc =  '''
                        GitHub:https://github.com/fluttercommunity/flutter_webview_plugin
                        使用了flutter_webview_plugin的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                                flutter_webview_plugin: ^0.3.5
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                              import 'package:flutter_webview_plugin/flutter_webview_plugin.dart'; ''';

  static const String qr_desc =  '''
                        GitHub:https://github.com/edufolly/flutter_mobile_vision
                        使用了的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                               flutter_mobile_vision_jamel: ^1.0.0
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                              import 'package:flutter_mobile_vision_jamel/flutter_mobile_vision_jamel.dart';
                            4.在androidmainifest.xml注册activity界面
                              <activity android:name="io.github.edufolly.fluttermobilevision.barcode.BarcodeCaptureActivity" />
                              <activity android:name="io.github.edufolly.fluttermobilevision.ocr.OcrCaptureActivity" />
                              <activity android:name="io.github.edufolly.fluttermobilevision.face.FaceCaptureActivity" />''';

  static const String alipay_desc =  '''
                        GitHub:https://github.com/best-flutter/flutter_alipay
                        阿里需要使用对应的服务端接收支付结果，创建订单等，本程序使用配套的服务端是：
                        GitHub:https://github.com/Flying9001/pay
                        使用了flutter_alipay的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                                flutter_alipay: ^0.1.0
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                              import 'package:flutter_alipay/flutter_alipay.dart';
                            4.在androidmainifest.xml加入权限
                            <uses-permission android:name="android.permission.INTERNET"/>
                            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
                            <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
                            <uses-permission android:name="android.permission.READ_PHONE_STATE" />
                            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />''';
  //TODO
  static const String wechat_desc =  '''
                        GitHub:https://github.com/pj0579/flutter_wechat
                        微信支付需要使用对应的服务端接收支付结果，创建订单等，本程序使用配套的服务端是：
                        GitHub:https://github.com/Flying9001/pay
                        使用了flutter_webview_plugin的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                                flutter_wechat: ^0.1.5
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                               import 'package:flutter_wechat/flutter_wechat.dart'; ''';

  static const String baidu_desc =  '''
                        GitHub:https://github.com/pj0579/flutter_wechat
                        微信支付需要使用对应的服务端接收支付结果，创建订单等，本程序使用配套的服务端是：
                        GitHub:https://github.com/Flying9001/pay
                        使用了flutter_webview_plugin的包作为依赖
                            使用步骤
                            1. 在pubspec.yaml 文件中加入
                              dependencies:
                                flutter_wechat: ^0.1.5
                            2. 安装,在terminal中命令输入
                              flutter pub get
                            3. 在对应使用的Dart文件代码中加入
                               import 'package:flutter_wechat/flutter_wechat.dart';
                            4.  在androidmainifest.xml加入权限
                            //百度地图SDK
                            <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
                            <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
                            //获取设备网络状态，禁用后无法获取网络状态
                            <uses-permission android:name="android.permission.INTERNET"/>
                            //网络权限，当禁用后，无法进行检索等相关业务
                            <uses-permission android:name="android.permission.READ_PHONE_STATE" />
                            //读取设备硬件信息，统计数据
                            <uses-permission android:name="com.android.launcher.permission.READ_SETTINGS" />
                            //读取系统信息，包含系统版本等信息，用作统计
                            <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
                            //获取设备的网络状态，鉴权所需网络代理
                            <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
                            //允许sd卡写权限，需写入地图数据，禁用后无法显示地图
                            <uses-permission android:name="android.permission.WRITE_SETTINGS" />
                            //获取统计数据
                            <uses-permission android:name="android.permission.GET_TASKS" />
                            加入service
                            <service
                              android:name="com.baidu.location.f"
                              android:enabled="true"
                              android:process=":remote" >
                          </service>
                          <meta-data
                              android:name="com.baidu.lbsapi.API_KEY"
                              android:value="Vw6iTrdwwerxoBG3POIvqoUSTrjQPYPk" />''';


  static List<Func> initSAPFunction() {
    if(first_page_function != null){
      return first_page_function;
    }

    first_page_function =  new List();
    //根据id查到buildRouter,进行跳转，只需要在跳转你的地方加入Application.router.navigateTo(context, "${item.id}");
    first_page_function.add(new Func("/asrt/asrt_page.dart", "语音识别", arst_desc, Icon(Icons.voice_chat),
          (BuildContext context) => ASRTPage("语音识别")));
    first_page_function.add(
        new Func("/image_picker/image_picker_page.dart", "拍照和本地相册",image_pick_desc,Icon(Icons.image),
              (BuildContext context) => ImagePickerPage("拍照和本地相册")));
    first_page_function.add(new Func("/qr_barcode_page/qr_barcode_page.dart", "二维码识别", qr_desc,Icon(Icons.local_bar),
            (BuildContext context) => QrPage("二维码和条形码扫描")));
    first_page_function.add(new Func("/web_page/web_view_page.dart", "WEBVIEW", webview_desc,Icon(Icons.web),
          (BuildContext context) => WebViewPage("webview demo")));
    first_page_function.add(new Func("/alipay_page/alipay_page.dart", "阿里支付",alipay_desc,Icon(Icons.mic),
            (BuildContext context) => AlipayPage("阿里支付")));
    first_page_function.add(new Func("/wechat_page/wechat_page.dart", "微信SDK",wechat_desc,
        Icon(Icons.whatshot),(BuildContext context) => WeChatPage("微信SDK")));
    first_page_function.add(new Func("/baidu_page/map_page.dart", "百度地图",baidu_desc,Icon(Icons.map),
            (BuildContext context) => BaiduMapPage()));
    first_page_function.add(new Func("/download_page/download_page.dart", "文件下载", image_pick_desc,
        Icon(Icons.file_download),(BuildContext context) => DownloadPage("文件下载")));
    first_page_function.add(new Func("/admob_page/admob_page.dart", "谷歌Admob", image_pick_desc,
        Icon(Icons.star),(BuildContext context) => AdmobPage("谷歌Admob")));
    return first_page_function;
  }

  static List<Func> second_page_function = new List();

  static List<Func> initOaFunction() {
    second_page_function.add(
        new Func("/image_picker_page.dart", "OA待办", "", Icon(Icons.camera)));
    second_page_function.add(
        new Func("/image_picker_page.dart", "OA在办", "", Icon(Icons.contacts)));
    second_page_function.add(
        new Func("/image_picker_page.dart", "OA已办", "", Icon(Icons.extension)));
    second_page_function.add(
        new Func("/image_picker_page.dart", "OA待阅", "", Icon(Icons.cake)));
    return second_page_function;
  }
}