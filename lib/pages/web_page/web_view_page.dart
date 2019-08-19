/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/9 16:30
  * 作用：web_view_page.dart webview例子
**/


import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import 'package:flutter_tools/widgets/button/common_button.dart';

class WebViewPage extends StatefulWidget {
  String url = "https://www.baidu.com";
  final String title;

  WebViewPage(this.title);

  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  bool _hasCollected = false;
  var _collectionIcons;
  TextEditingController _controller = new TextEditingController();
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
//    _controller.addListener(() {
//      setState(() {
//        flutterWebviewPlugin.reloadUrl(_controller.value.text);
//      });
//    });
  }

  // 点击收藏按钮
  _getCollection() {

  }

  // 跳转链接
  _gotoWebview() {
    setState(() {
      widget.url = _controller.value.text;
      flutterWebviewPlugin.reloadUrl(widget.url);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    Widget _body = new Column(
      children: [new Row(
        children: [Expanded(
          child: Theme(
            data: new ThemeData(
                primaryColor: Colors.red, hintColor: Colors.blue),
                child: new TextField(
                  //控制键盘的功能键 指enter键，比如此处设置为next时，enter键
                  //显示的文字内容为 下一步
                  textInputAction: TextInputAction.go,
                  controller: _controller,
                  decoration: InputDecoration(
                      hintText: '在这输入网址',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 18),
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
    //            borderSide: BorderSide(color: Colors.red, width: 3.0, style: BorderStyle.solid)//没什么卵效果
                      )),
                  //允许的输入格式 下方的模式指只允许输入数字
    //            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  autofocus: false,
                  style: Theme
                      .of(context)
                      .textTheme
                      .title,
                  //内容提交(按回车)的回调
                  onSubmitted: (text) {
                    _gotoWebview();
                  },
                ),),
        ),
//        new IconButton(
//          onPressed: _gotoWebview,
//          icon: Icon(
//            Icons.arrow_right,
//            color: Colors.lightBlue,
//          ),
//        ),
        ],
      ),
      Expanded(child: WebviewScaffold(
        url: widget.url,
        withZoom: false,
        withLocalStorage: true,
        withJavascript: true,
      ))
      ],
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(widget.title, _collectionIcons, _getCollection),
      body: _body,
    );
  }
}
