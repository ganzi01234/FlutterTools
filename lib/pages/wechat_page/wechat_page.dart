/**
 * 说明：
 * 作者：gyz
 * 添加时间：2019/8/14 14:33
 * 作用：wechat_page.dart 微信相关SDK demo
 **/

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import 'package:flutter_wechat/flutter_wechat.dart';
import 'package:flutter_tools/main.dart';

class WeChatPage extends StatefulWidget {
  final String title;

  WeChatPage(this.title);

  _WeChatPageState createState() => _WeChatPageState();
}

class _WeChatPageState extends State<WeChatPage> {
  bool _hasCollected = false;
  var _collectionIcons;
  String payContent = "微信支付";
  String shareContent = "微信文字分享";
  String shareImg = "微信图片分享";
  String shareLink = "微信链接分享";
  String login = "微信登录";
  final myController = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    _initWechat();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 点击收藏按钮
  _getCollection() {

  }

  _initWechat() async{
    await FlutterWechat.registerWechat("wxf07cd9e63da64c70");// 微信注册需要在你需要的地方注册，最好是app首页
  }


  _wechatShared() async{
    await FlutterWechat.shareText(text: "Flutter Tools项目分享，快速构建Flutter APP", type:0,);//文字分享 type 0 聊天页面 1 朋友圈
  }

  _wechatSharedImg() async{
    await FlutterWechat.shareImage(imgUrl: "https://mmbiz.qlogo.cn/mmbiz_png/GgNSgANKbLIfIxzLK9iaPY0ibtd9icFGocqbkBMD4y96UnfotmOnbV4DVl1U8SSX2cN8eSEZab45KlphYehzQtzGg/0?wx_fmt=png", type:0,);
//    await FlutterWechat.shareMusic(imgUrl: "xxx", musicUrl:"",title:"",description:"",musicDataUrl:"",musicLowBandDataUrl:"",musicLowBandUrl:"",type:0,);
//    await FlutterWechat.shareVideo(imgUrl: "xxx", videoUrl:"",title:"",description:"",videoLowBandUrl:"",type:0,);
//    await FlutterWechat.shareWebPage(imgUrl: "xxx", webpageUrl:"",title:"",description:"",type:0,);

  }

  _wechatSharedLink() async{
//    await FlutterWechat.shareWebPage(imgUrl: "https://mmbiz.qlogo.cn/mmbiz_png/GgNSgANKbLIfIxzLK9iaPY0ibtd9icFGocqbkBMD4y96UnfotmOnbV4DVl1U8SSX2cN8eSEZab45KlphYehzQtzGg/0?wx_fmt=png", type:0,);
//    await FlutterWechat.shareMusic(imgUrl: "xxx", musicUrl:"",title:"",description:"",musicDataUrl:"",musicLowBandDataUrl:"",musicLowBandUrl:"",type:0,);
//    await FlutterWechat.shareVideo(imgUrl: "xxx", videoUrl:"",title:"",description:"",videoLowBandUrl:"",type:0,);
    await FlutterWechat.shareWebPage(imgUrl: "https://mmbiz.qlogo.cn/mmbiz_png/GgNSgANKbLIfIxzLK9iaPY0ibtd9icFGocqbkBMD4y96UnfotmOnbV4DVl1U8SSX2cN8eSEZab45KlphYehzQtzGg/0?wx_fmt=png",
      webpageUrl:"https://github.com/ganzi01234/FlutterTools/",title:"Flutter Tools",description:"Flutter Tools项目分享，快速构建Flutter APP",type:0,);

  }
///微信登录，没有注册
  _wechatLogin() async{

    await FlutterWechat.login(scope:"",state:"");
  }

  _WeChatPay() async{
    await FlutterWechat.pay(partnerId: "",prepayId: "",nonceStr: "",timeStamp: "",sign: "",package: "",appId: "",).then((state){print(state);});
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
            children: [ Icon(Icons.share),
            new Text(shareContent,
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _wechatShared),
          FlatButton(child: new Row(
            children: [ Icon(Icons.screen_share),
            new Text(shareImg,
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _wechatSharedImg),
          FlatButton(child: new Row(
            children: [ Icon(Icons.link),
            new Text(shareLink,
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _wechatSharedLink),
          FlatButton(child: new Row(
            children: [ Icon(Icons.check),
            new Text(login,
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _wechatLogin),
          FlatButton(child: new Row(
            children: [ Icon(Icons.payment),
            new Text(payContent,
              style: new TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
            ],
          ), onPressed: _WeChatPay),
        ],
      ),
    );
  }
}


