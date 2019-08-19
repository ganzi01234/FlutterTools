/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/16 10:46
  * 作用：map_page.dart 百度地图调用实现
**/


import 'package:flutter/material.dart';
import './mapfunction_page.dart';
import './location_page.dart';
import './bsmap_cj_controller.dart';
import 'package:flutter_tools/widgets/button/common_button.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import './cj_base.dart';
import 'package:permission/permission.dart';
import 'package:flutter_tools/widgets/toast/toast.dart' as toast;
import 'package:flutter_tools/main.dart';

class BaiduMapPage extends StatefulWidget {
  @override
  _BaiduMapPageState createState() => _BaiduMapPageState();
}

class _BaiduMapPageState extends State<BaiduMapPage> {
  BsMapCJLineController _controller;
  BsCJBase _cj;

  @override
  void initState(){
    super.initState();

    _controller = BsMapCJLineController(onMessage: (method, config) {
      if (method == "click_overlay") {
        _cj.onClick(config);
      }
    });
  }
  @override
  void dispose() {
    super.dispose();
  }

  _requestPermission() async{
    var permissionNames = await Permission.requestPermissions(
        [PermissionName.Location, PermissionName.Storage]);
    if (permissionNames[0] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予读取手机状态权限');
      return;
    } else if (permissionNames[1] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予存储权限');
      return;
    }
  }

  @override
  Widget build(BuildContext context){
    _requestPermission();
    return Scaffold(
      appBar: CommonAppBar("百度地图测试"),
      body: Row(
        //child 居中均分空间
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            child: Text("定位"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) =>
                    LocationPage(controller: _controller,)),
              );
            },
          ),
          OutlineButton(
            child: Text("地图功能"),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => MapFunctionPageTest()),
              );
            },
          ),
        ],
      ),
    );
  }
}
