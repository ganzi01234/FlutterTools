/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/9 9:57
  * 作用：app_bar.dart公用appbar组件
**/


import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter_tools/resources/icon_names.dart';

final int len = IconNames.names.length;

// CommonAppBar 自定义的实例
class CommonAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final double height;
  final IconData _collectionIcons;
  final VoidCallback _getCollection;
  final PreferredSizeWidget bottom;

  CommonAppBar([
    this.title = '公用AppBar',
    this._collectionIcons = Icons.favorite,
    this._getCollection,
    this.bottom,
    this.height = 56.0]):super();

  getIcons() {
    return Icons;
  }

  @override
  Size get preferredSize {
    return new Size.fromHeight(height);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          }),
      title: new Text(title == null ? "" : title,
        style: new TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 18,
        ),
      ),
      actions: <Widget>[
        new IconButton(
          onPressed: _getCollection,
          icon: Icon(
            _collectionIcons,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

