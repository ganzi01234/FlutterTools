/**
 * 说明：
 * 作者：gyz
 * 添加时间：2019/8/8 13:39
 * 作用：home.dart 首页
 **/


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_tools/pages/first/first_page.dart';
import 'package:flutter_tools/pages/first/oafunc_page.dart';
import 'package:flutter_tools/pages/introduce/introduce_page.dart';
import 'package:flutter_tools/utils/provider.dart';
///路由相关包导入
import 'package:flutter_tools/routers/application.dart';
import 'package:flutter_tools/routers/routers.dart';
import 'package:fluro/fluro.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<AppPage>
    with SingleTickerProviderStateMixin {
//  SpUtil sp;
//  WidgetControlModel widgetControl = new WidgetControlModel();
//  SearchHistoryList searchHistoryList;
  bool isSearch = false;
  String appBarTitle = tabData[0]['text'];
  List<Widget> _list = List();
  int _currentIndex = 0;
  static List tabData = [
    {'text': '首页', 'icon': Icon(Icons.home)},
    {'text': '功能', 'icon': Icon(Icons.message)},
    {'text': '关于我们', 'icon': Icon(Icons.contacts)},
    {'text': '小游戏', 'icon': Icon(Icons.games)},
  ];

  List<BottomNavigationBarItem> _myTabs = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < tabData.length; i++) {
      _myTabs.add(BottomNavigationBarItem(
        icon: tabData[i]['icon'],
        title: Text(
          tabData[i]['text'],
        ),
      ));
    }
    _list
//      ..add(FirstPage())
//      ..add(MainPage())
      ..add(FirstPage(Provider.db))..add(OaFuncPage())..add(IntroducePage());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text('Flutter Tools',
        style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),),
      body: IndexedStack(
        index: _currentIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _myTabs,
        //高亮  被点击高亮
        currentIndex: _currentIndex,
        //修改 页面
        onTap: _itemTapped,
        //shifting :按钮点击移动效果
        //fixed：固定
        type: BottomNavigationBarType.fixed,

        fixedColor: Color(0xFF64B5F6),
      ),
    );
  }

  void _itemTapped(int index) {
    if(index == 3){
      Application.router.navigateTo(context, Routes.gamePage,transition: TransitionType.inFromRight);
    }else{
      setState(() {
        _currentIndex = index;
        appBarTitle = tabData[index]['text'];
      });
    }

  }
}
