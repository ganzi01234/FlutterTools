/// Author: 一凨 
/// Date: 2019-01-11 14:39:48 
/// Last Modified by: 一凨
/// Last Modified time: 2019-01-11 14:40:09

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_tools/model/cat.dart';
import 'package:flutter_tools/components/widget_item_container.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_tools/constants/constants.dart';
import 'package:flutter_tools/model/function.dart';
import 'package:flutter_tools/widgets/toast/toast.dart';

class OaFuncPage extends StatefulWidget {
  @override
  FuncPageState createState() => new FuncPageState();
}

class FuncPageState extends State<OaFuncPage>
    with AutomaticKeepAliveClientMixin {
//  CatControlModel catModel;

  FuncPageState() : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';
  List<Func> _firstChildList = new List();
//  CatControlModel catControl = new CatControlModel();
//
//  List<Cat> categories = [];


  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _firstChildList = Constants.initOaFunction();
  }

  MaterialButton buildButtonColumn(IconData icon, String label,
      VoidCallback onPressed) {
    Color color = Theme
        .of(context)
        .primaryColor;

    return MaterialButton(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(icon, color: color),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(
              label,
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),),
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }

  Widget getItemContainer(Func item) {
    return new GestureDetector(
      onTap: () {
        Toast.show(context, item.name+"功能待实现");
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
    Widget firstSection = Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.white,
        child: new Column(
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              ],
            ),
          ],
        ));

    Widget secondSection = new Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          child: GridView.builder(
              itemCount: _firstChildList.length,
              //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //横轴元素个数
                  crossAxisCount: 4,
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
//            firstSection,
            secondSection,
          ],
        ));
  }

}
