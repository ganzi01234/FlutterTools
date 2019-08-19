/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/9 9:57
  * 作用：common_button.dart公用button组件
**/


import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_tools/resources/icon_names.dart';

final int len = IconNames.names.length;

// CommonButtonCustom 自定义的实例
class CommonButtonCustom extends StatelessWidget {
  final String txt;
  final IconData icon;
  final VoidCallback onPressed;

  const CommonButtonCustom([
    this.txt = '公用按钮',
    this.icon = Icons.comment,
    this.onPressed])
      : super();

  getIcons() {
    return Icons;
  }

  @override
  Widget build(BuildContext context) {
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
              txt,
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
}
//    final int iconIndex = Random.secure().nextInt(len);
//    final IconData type = IconNames.names[iconIndex];
//    final _onPressed = onPressed;
//    return IconButton(
//        // 定义图标在IconButton中的定位方式,AlignmentGeometry 如果父Widget尺寸大于child Widget尺寸，这个属性设置会起作用，有很多种对齐方式。
//        alignment:AlignmentDirectional.center,
//        // 按钮颜色
//        color: _randomColor(),
//        // 如果图标被禁用，则用于按钮内图标的颜色。默认为当前主题的ThemeData.disabledColor
//        disabledColor:_randomColor(),
//        // 高亮时的背景色
//        highlightColor: Colors.yellow,
//        // 按钮内图标的大小
//        icon:Icon(type),
//        // 图标尺寸
//        iconSize:(Random.secure().nextInt(20)+20).toDouble(), // 随机大小
//        // 按钮内部,墨汁飞溅的颜色,点击按钮时的渐变背景色，当你不设置高亮背景时才会看的更清楚
//        splashColor: _randomColor(),
//        padding:  EdgeInsets.only(bottom: 5.0, top: 5.0, left: 30.0, right: 10.0),
//        // 描述按下按钮时将发生的操作的文本
//        tooltip:'这是${ type.codePoint }信息',
//        // IconButton 的点击事件
//        onPressed: () {
//          // Perform some action
//          if (_onPressed is VoidCallback) {
//            _onPressed();
//          }
//        });
//  }

