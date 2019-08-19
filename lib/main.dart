import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'routers/application.dart';
import 'package:flutter_tools/utils/analytics.dart' as Analytics;
import 'package:flutter_tools/pages/home.dart';
import 'routers/routers.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_tools/utils/provider.dart';
import 'package:firebase_admob/firebase_admob.dart';

const int ThemeColor = 0xFF64B5F6;

class MyApp extends StatefulWidget {

  MyApp() {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  @override
  MyAppState createState() => MyAppState();
}
var db;
///广告代码，可删除
const String testDevice = 'A861FA6C5AC9C6AB78A3BCD4754D1555';
class MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  ///广告代码，可删除
  static BannerAd bannerAd;
  static InterstitialAd interstitialAd;
  int _coins = 0;

  @override
  Future initState() {
    super.initState();
    ///广告代码，可删除
    FirebaseAdMob.instance.initialize(appId: getAppId());
    bannerAd = createBannerAd();
    interstitialAd = createInterstitialAd();
  }

  @override
  void dispose() {
    ///广告代码，可删除
    bannerAd?.dispose();
    interstitialAd?.dispose();
    super.dispose();
  }

  final ThemeData theme = new ThemeData(
    primaryColor: Color(ThemeColor),
    backgroundColor: Color(0xFFEFEFEF),
    accentColor: Color(0xFF888888),
    textTheme: TextTheme(
      //设置Material的默认字体样式
      body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
    ),
    iconTheme: IconThemeData(
      color: Color(ThemeColor),
      size: 35.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Tools',
      theme: theme,
      home: new Scaffold(
          key: scaffoldState, body: AppPage()),
      //去掉debug logo
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
//      navigatorObservers: <NavigatorObserver>[Analytics.observer],
    );
  }

  ///广告代码，可删除
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );


  ///广告代码初始化banner类型广告，可删除
  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }
  ///广告代码初始化激励类型广告，可删除
  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event $event");
      },
    );
  }
  ///广告代码APP初始化，可删除
  String getAppId() {
    if (Platform.isIOS) {
      return '';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-8710877676213538~2025661874';
    }
    return null;
  }
}

void main() async {
  final provider = new Provider();
  await provider.init(true);
  db = Provider.db;
  runApp(new MyApp());
}

