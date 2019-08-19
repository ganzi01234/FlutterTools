/// Author: 一凨 
/// Date: 2019-01-11 14:39:48 
/// Last Modified by: 一凨
/// Last Modified time: 2019-01-11 14:40:09

import 'package:flutter/material.dart';

import 'package:flutter_tools/constants/constants.dart';
import 'package:flutter_tools/model/function.dart';
import 'package:flutter_tools/routers/application.dart';
import 'package:flutter_tools/model/cat.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_tools/main.dart';

class FirstPage extends StatefulWidget {
  final db;
  final CatControlModel catModel;
  FirstPage(this.db)
      : catModel = new CatControlModel(),
        super();
  @override
  FirstPageState createState() => new FirstPageState(catModel);
}

class FirstPageState extends State<FirstPage>
    with AutomaticKeepAliveClientMixin {
  CatControlModel catModel;
  FirstPageState(this.catModel) : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';
  List<Func> _firstChildList = new List();


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _firstChildList = Constants.initSAPFunction();
  }

  Widget getItemContainer(Func item) {
    return new GestureDetector(
      onTap: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) => ASRTPage(item.name)));
        Application.router.navigateTo(context, "${item.id}",transition: TransitionType.inFromRight);
      },
      child: Container(
        width: 10.0,
        height: 10.0,
        alignment: Alignment.center,
        child: new Center(
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                item.icon,
                Text(
                  item.name,
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                )
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget secondSection = new Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          child: GridView.builder(
              itemCount: _firstChildList.length,
              //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                  crossAxisCount: 3,
                  //纵轴间距
                  mainAxisSpacing: 1.0,
                  //横轴间距
                  crossAxisSpacing: 1.0,
                  //子组件宽高长度比例
                  childAspectRatio: 1.3),
              itemBuilder: (BuildContext context, int index) {
                return getItemContainer(_firstChildList[index]);
              }),
        )
    );

    return Container(
        child: new Column(
          children: [
            secondSection,
          ],
        ));
  }

}
