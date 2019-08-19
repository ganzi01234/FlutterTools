/**
 * 说明：
 * 作者：gyz
 * 添加时间：2019/8/9 16:33
 * 作用：alipay_page.dart 阿里支付demo
 **/
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import 'package:flutter_tools/widgets/button/common_button.dart';
import 'package:flutter_tools/main.dart';
import 'package:flutter_alipay/flutter_alipay.dart';
import 'package:flutter_tools/http/data_utils.dart';
import 'package:permission/permission.dart';
import 'package:flutter_tools/widgets/toast/toast.dart' as toast;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AlipayPage extends StatefulWidget {
  final String title;

  AlipayPage(this.title);

  _AlipayPageState createState() => _AlipayPageState();
}

class _AlipayPageState extends State<AlipayPage> {
  bool _hasCollected = false;
  var _collectionIcons;
  String payContent;
  String _payInfo = "";
  final myController = new TextEditingController();

  bool isLoading = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    ///业务代码
    _loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildLoading() {
    if (isLoading) {
      return Opacity(
        opacity: .5,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color: Colors.black,
          ),
          child: SpinKitPouringHourglass(color: Colors.white),
        ),
      );
    }
    return Container();
  }


  // 点击收藏按钮
  _getCollection() {

  }

  // 支付
  _pay() async {
    var result = await FlutterAlipay.pay(_payInfo);
    setState(() {
      myController.text = result;
    });
  }

  onChanged(String value) {
    _payInfo = value;
  }

  void _loadData() async{
    _payInfo = "";
    var permissionNames = await Permission.requestPermissions(
        [PermissionName.Phone, PermissionName.Storage]);
    if (permissionNames[0] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予读取手机状态权限');
    } else if (permissionNames[1] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予存储权限');
    } else {
      setState(() {
        isLoading = true;
      });
      buildLoading();
      //如果授权同意
      DataUtils.alipay(
          {"payType": "13", "orderNo": "123", "ip": "127.0.0.1", "amount": "1"})
          .then((response) {
        if (response.code == 200) {
          setState(() {
            isLoading = false;
          });
          String data = response.prePayOrderInfo;
          if (data != null) {
            setState(() {
              _payInfo = data;
              myController.text = _payInfo;
            });
            return;
          }
        }
        throw new Exception("创建订单失败");
      }).catchError((e) {
        setState(() {
          isLoading = false;
          _payInfo = e.toString();
          myController.text = _payInfo;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: CommonAppBar(widget.title, _collectionIcons, _getCollection),
      body: new Column(
        children: [
          FlatButton(child: new Row(
            children: [ Icon(Icons.payment),
            new Text("调起支付宝",
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _pay),
          new TextField(
              maxLines: 15, onChanged: onChanged, controller: myController),
        ],
      ),
    );
  }
}


