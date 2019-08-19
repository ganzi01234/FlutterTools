import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:flutter_tools/components/category.dart';
import 'package:flutter_tools/components/full_screen_code_dialog.dart';
import '../widgets/404.dart';
import 'package:flutter_tools/pages/home.dart';
import 'package:flutter_tools/pages/login/login_page.dart';
import 'package:flutter_tools/pages/web_page/web_view_page.dart';
import 'package:flutter_tools/pages/image_picker/image_picker_page.dart';
import 'package:flutter_tools/pages/game_page/game_page.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new AppPage();
  },
);

var categoryHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    String name = "Scroll";

    return new CategoryHome(name);
  },
);

var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new WidgetNotFound();
    });

var loginPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return LoginPage();
    });

var fullScreenCodeDialog = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String path = params['filePath']?.first;
      return new FullScreenCodeDialog(
        filePath: path,
      );
    });

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params['title']?.first;
//      String url = params['url']?.first;
      return new WebViewPage(title);
    });
///游戏相关跳转
var gamePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String title = params['title']?.first;
//      String url = params['url']?.first;
      return new GamePage();
    });
///首页跳转集
var functionHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params['title']?.first;
      return new ImagePickerPage(title);
    });
