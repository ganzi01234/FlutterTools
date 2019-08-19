/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/16 10:45
  * 作用：download_page.dart 下载demo实现
**/

import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/button/common_button.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission/permission.dart';
import 'package:flutter_tools/model/collection.dart';
import 'package:flutter_tools/event/event_bus.dart';
import 'package:flutter_tools/event/event_model.dart';
import 'package:flutter_tools/main.dart';


class AdmobPage extends StatefulWidget {
  final String title;

  AdmobPage(this.title);

  @override
  _AdmobPageState createState() => _AdmobPageState();
}

class _AdmobPageState extends State<AdmobPage> {
  bool _hasCollected = false;
  var _collectionIcons;
  File _image;
  String title;
  String _router = '';
  CollectionControlModel _collectionControl = new CollectionControlModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ///业务代码
    _collectionControl
        .getRouterByName(Uri.encodeComponent(widget.title.trim()))
        .then((list) {
      list.forEach((item) {
        if (widget.title.trim() == item['name']) {
          _router = item['router'];
        }
      });
      if (mounted) {
        setState(() {
          _hasCollected = list.length > 0;
        });
      }
    });
  }

  @override
  void dispose() {
    MyAppState.bannerAd.dispose();
    MyAppState.bannerAd = null;

    MyAppState.interstitialAd.dispose();
    MyAppState.interstitialAd = null;
    super.dispose();
  }

  _getCollection() {
    if (_hasCollected) {
      // 删除操作
      _collectionControl
          .deleteByName(Uri.encodeComponent(widget.title.trim()))
          .then((result) {
        if (result > 0 && this.mounted) {
          setState(() {
            _hasCollected = false;
          });
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('已取消收藏')));
          if (ApplicationEvent.event != null) {
            ApplicationEvent.event
                .fire(CollectionEvent(widget.title, _router, true));
          }
          return;
        }
        print('删除错误');
      });
    } else {
      // 插入操作
      _collectionControl
          .insert(Collection(
          name: Uri.encodeComponent(widget.title.trim()),
          router: widget.title))
          .then((result) {
        if (this.mounted) {
          setState(() {
            _hasCollected = true;
          });

          if (ApplicationEvent.event != null) {
            ApplicationEvent.event
                .fire(CollectionEvent(widget.title, _router, false));
          }
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('收藏成功')));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Permission.requestPermissions([PermissionName.Camera, PermissionName.Storage]);
    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    Widget section = Container(
        padding: const EdgeInsets.all(12.0),
        color: Colors.white,
        child: new Column(
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CommonButtonCustom('BANNER广告', Icons.star_border, _showBannerAd),
                CommonButtonCustom('全屏广告', Icons.stars, _showInterstitialAd),
//                CommonButtonCustom('高级广告', Icons.star, _selectedCarmea),
              ],
            ),
            Expanded(child: _image == null
                ? new Container(width: 0.0, height: 0.0)
                : Image.file(_image),)
          ],
        ));
    return new Scaffold(
      appBar: new CommonAppBar(title, _collectionIcons, _getCollection),
      body: section,
    );
  }


  void _showInterstitialAd() {
    MyAppState.interstitialAd?.dispose();
    MyAppState.interstitialAd..load()..show();
  }

  void _showBannerAd() {
    MyAppState.bannerAd?.dispose();
    MyAppState.bannerAd..load()..show();
  }
}
