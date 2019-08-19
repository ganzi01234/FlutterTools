
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tools/utils/analytics.dart' show analytics;
import 'package:flutter_tools/constants/constants.dart';

import '../widgets/index.dart';
import './router_handler.dart';

class Routes {
  static String root = "/";
  static String home = "/home";
  static String widgetDemo = '/widget-demo';
  static String codeView = '/code-view';
  static String webViewPage = '/web-view-page';
  static String gamePage = '/pages/game_page/game_page.dart';
  static String loginPage = '/loginpage';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
        });
    router.define(home, handler: homeHandler);

    router.define('/category/:type', handler: categoryHandler);
    router.define('/category/error/404', handler: widgetNotFoundHandler);
    router.define(loginPage, handler: loginPageHandler);
    router.define(codeView,handler:fullScreenCodeDialog);
    router.define(webViewPage,handler:webViewPageHand);
    router.define(gamePage,handler:gamePageHandler);
    //首页跳转逻辑框架定义
    List functionList = Constants.initSAPFunction();
    functionList.forEach((function) {
      Handler handler = new Handler(
          handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//            String url = params['url']?.first;
            return function.buildRouter(context);
          });
      router.define('${function.id}', handler: handler);
    });
  }
}
