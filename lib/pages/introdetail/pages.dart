import 'package:flutter/material.dart';

import '../../routers/application.dart';
import '../../routers/routers.dart';
import '../../utils/shared_preferences.dart';

final pages = [
  PageViewModel(
      const Color(0xFF8BC34A),
//      'assets/mountain.png',
      'assets/images/p2.png',
      'Flutter Tools',
      '集成了常用的package，提供完善的使用代码示例，经过作者二次测试调试，实现了一些基本的功能，您可以参考作者代码使用，快速构建您的Flutter应用程序',
      'assets/images/plane.png'),
  PageViewModel(
      const Color(0xFFFF5722),
      //'assets/world.png',
      'assets/images/p1.png',
      'Flutter Tools集成的包',
      '现接入的包：语音识别（record_wav，后端采用ARST语言识别系统，也采用了谷歌语音识别（google cloud speech api，需要翻墙，支持中文日文）），拍照和本地相册读取照片（image_picker），二维码识别（flutter_mobile_vision_jamel），Webview（flutter_webview_plugin），'
          '阿里支付（flutter_alipay），微信SDK（flutter_wechat），百度地图（fm_baidu_map），谷歌admob（）'
          '',
      'assets/images/calendar.png'),
  PageViewModel(
    const Color(0xFF3F51B5),
    //'assets/home.png',
    'assets/images/p3.png',
    'Flutter Tools的优势',
    '1、您可以直接基于Flutter作为您的开发框架进行APP开发，它的基础框架同时支持IOS和ANDROID和WEB应用构建，不需要您再去重新构建框架。\n'
        '2、制作了漂亮的框架代码，使代码简单易理解。\n'
        '3、常用的pub包已经集成在项目中，它们模块化地在page中展示，您可以简单的查看pages文件夹下的应用方式，不需要重新去http://pub.dev/去get，直接在项目中使用。\n'
        '4、持续更新，Flutter Tools的作者还会持续更新最新好用的第三方pub框架，包括：常用功能框架、精美UI框架等等。\n'
        '请持续关注：http://git地址',//TODO
    'assets/images/house.png',
  ),
];
SpUtil sp;

class Page extends StatelessWidget {
  final PageViewModel viewModel;
  final double percentVisible;
  Page({
    this.viewModel,
    this.percentVisible = 1.0,
  });
  _goHomePage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  Widget creatButton(
      BuildContext context, String txt, IconData iconName, String type) {
    return RaisedButton.icon(
        onPressed: () async {
          if (type == 'start') {
            await SpUtil.getInstance()
              ..putBool(SharedPreferencesKeys.showWelcome, false);
            _goHomePage(context);
          } else if (type == 'goGitHub') {
            Application.router.navigateTo(context,
                '${Routes.webViewPage}?title=${Uri.encodeComponent(txt)} Doc&&url=${Uri.encodeComponent("//TODO")}');
          }
        },
        elevation: 10.0,
        color: Colors.black26,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(20.0))),
        //如果不手动设置icon和text颜色,则默认使用foregroundColor颜色
        icon: Icon(iconName, color: Colors.white, size: 14.0),
        label: Text(
          txt,
          maxLines: 1,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        //alignment: const Alignment(1.2, 0.6),
        children: [
          Container(
              width: double.infinity,
              /// height:MediaQuery.of(context).size.height-200.0,
              color: viewModel.color,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Opacity(
                opacity: percentVisible,
                child: ListView(
                  children: <Widget>[
                    layout(context),
                  ],
                ),
              )
          ),
          Positioned(
              right: -5.0,
              top: 2.0,
              child: creatButton(context, 'GitHub', Icons.arrow_forward, 'goGitHub')
          ),
        ]
    );
  }

  Column layout(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            transform: Matrix4.translationValues(
                0.0, 50.0 * (1.0 - percentVisible), 0.0),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Image.asset(viewModel.heroAssetPath,
                  width: 160.0, height: 160.0),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, 30.0 * (1.0 - percentVisible), 0.0),
            child: Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                viewModel.title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'FlamanteRoma',
                  fontSize: 28.0,
                ),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(
                0.0, 30.0 * (1.0 - percentVisible), 0.0),
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                viewModel.body,
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  fontFamily: 'FlamanteRomaItalic',
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
//          ButtonBar(
//            alignment: MainAxisAlignment.center,
//            children: <Widget>[
//              creatButton(context, '开始使用', Icons.add_circle_outline, 'start'),
//              creatButton(context, 'GitHub', Icons.arrow_forward, 'goGithub'),
//            ],
//          )
        ]);
  }
}

class PageViewModel {
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath,
  );
}
