/**
  * 说明：
  * 作者：gyz
  * 添加时间：2019/8/16 10:46
  * 作用：asrt_page.dart ASRT语音识别demo实现
**/


import 'dart:io';
import 'dart:convert' as BASE64;
import 'package:flutter/material.dart';

import 'package:flutter_tools/widgets/toast/toast.dart' as toast;

// Import record package
import 'package:flutter_toolslib/recorder_wav.dart';
import 'package:flutter_toolslib/float_window.dart';
import 'package:permission/permission.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tools/utils/shared_preferences.dart';
import 'package:googleapis/speech/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_tools/api/api.dart';
import 'dart:async';
import 'package:flutter_tools/model/collection.dart';
import 'package:flutter_tools/widgets/appbar/app_bar.dart';
import 'package:flutter_tools/event/event_bus.dart';
import 'package:flutter_tools/event/event_model.dart';

import 'package:dio/dio.dart';

const double _ITEM_HEIGHT = 70.0;

class ASRTPage extends StatefulWidget {

  final String title;

  ASRTPage(this.title);

  @override
  _ASRTPageState createState() => new _ASRTPageState(title);
}

class _ASRTPageState extends State<ASRTPage>
    with AutomaticKeepAliveClientMixin {

  _ASRTPageState(this.title) : super();

  TextEditingController controller;
  String title;

  String active = 'test';
  String data = '无';

  ScrollController _scrollController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    //此处为新添加代码------start
    _scrollController = new ScrollController();
    _InitSharedPreference();
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


  String _textToShow = "I Like Flutter";
  String _translateTextToShow = "";

  final String _itemValue1 = '中文语音识别';
  final String _itemValue2 = '谷歌语音识别（要翻墙）';
  final String _itemValue3 = '日文语音识别';
  String _itemValue = '中文语音识别';
  String _selectKey = 'selectKey';
  SpUtil sp;
  List list = List();
  bool _hasCollected = false;
  var _collectionIcons;
  CollectionControlModel _collectionControl = new CollectionControlModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _router = '';

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
    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    return new Scaffold(
      appBar: new CommonAppBar(title, _collectionIcons, _getCollection),
      body: new Column(
        children: [
          DropdownButton(
            items: getListData(),
            //下拉菜单选择完之后显示给用户的值
            value:_itemValue,
            //下拉菜单item点击之后的回调
            onChanged: (T) {
              if (mounted) {
                setState(() {
                  _itemValue = T;
                  sp.putString(_selectKey, _itemValue);
                });
              }
            }
            ,
            //设置阴影的高度
            elevation: 12,
            // isDense: true,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
            // 将下拉列表的内部内容设置为水平填充其父级
            isExpanded: true,
            iconSize
                : 30.0, //设置三角标icon的大小
          ),
          Expanded(child: Container
            (
            margin: const EdgeInsets.only(bottom:
            100),
            child: new Center(
              child:
              ListView.builder(
                //确定每一个item的高度 会让item加载更加高效
//                itemExtent: 40.0,
//                shrinkWrap: true,
                  controller: _scrollController,
                  itemCount:
                  list.length + 1,
                  itemBuilder: (context
                      , index) {
                    if (index == list.length) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Center(
                          child: null,
                        ),
                      );
                    }

                    return new Container(
                      child: new Column(
                        children: <Widget>[
                          new GestureDetector(
                            onTap: () {
                              _translate(list[index]);
                              //处理点击事件
                            },
                            child: new Container(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                trailing: new Icon(Icons.keyboard_arrow_right),
                                title: new Text(list[index],
                                  style: new TextStyle(
                                    fontSize: 15,
                                  ),
                                  maxLines: 10,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),
            ),
          ),),
//          MaterialTapButton(
//            radius: 200,
//            backgroundColor: Colors.lightBlueAccent,
//            child:new Text("点击开启浮动窗口"),
//            onTap: _StartFloatWindow,
//          ),
//          MaterialTapButton(
//            radius: 200,
//            backgroundColor: Colors.lightBlueAccent,
//            child:new Text("点击跳转TTS窗口"),
//            onTap: _TTS,
//          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10
          ),
          //宽度
          width: 80,
          //高度
          height: 80,
          child: FloatingActionButton(
            elevation: 2.0,
            highlightElevation: 15.0,
            onPressed: null,
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.mic,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        onTapDown: (TapDownDetails details) async {
          _MicLongTap();
//                _MicReord();
        },
        onTapUp: (TapUpDetails details) async {
          _MicOnTapCancel();
//                _MicStopReord();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

//获得选项数据，包含中文，英文，韩文选项
  List<DropdownMenuItem> getListData() {
    List<DropdownMenuItem> items = List();
    DropdownMenuItem dropdownMenuItem1 = DropdownMenuItem(
      child: Text('$_itemValue1'),
      value: '$_itemValue1',
    );
    items.add(dropdownMenuItem1);
    DropdownMenuItem dropdownMenuItem2 = DropdownMenuItem(
      child: Text('$_itemValue2'),
      value: '$_itemValue2',
    );
    items.add(dropdownMenuItem2);
    DropdownMenuItem dropdownMenuItem3 = DropdownMenuItem(
      child: Text('$_itemValue3'),
      value: '$_itemValue3',
    );
    items.add(dropdownMenuItem3);
    return items;
  }

  void showMenuSelection(String value) {
    if (<String>[_itemValue1, _itemValue2, _itemValue3].contains(value)) {
      setState(() {
        _itemValue = value;
      });
    }
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('You selected: $value')));
  }

  //翻译 默认翻译为中文
  void _translate(String text) async {
    final translator = new GoogleTranslator();

    var translation = await translator.translate(
        text, from: 'ja', to: 'zh-cn');
    setState(() {
      toast.Toast.show(context, translation);
    });
  }

//  _TTS() async{
//    Navigator.push(context, MaterialPageRoute(builder: (context) => VoiceSetPage(title: "Setting")));
//  }

  _MicLongTap() async {
    //Start recorder
    var permissionNames = await Permission.requestPermissions(
        [PermissionName.Microphone, PermissionName.Storage]);
    if (permissionNames[0] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予录音权限');
    } else if (permissionNames[1] == PermissionStatus.deny) {
      //如果拒绝
      toast.Toast.show(context, '此功能需要授予存储权限');
    } else {
      //如果授权同意
      RecorderWav.startRecorder();
      toast.Toast.showDetail(context, '按住说话');
    }
  }

  _MicOnTapCancel() async {
    //Stop recorder & get filepath
    String filePath = await RecorderWav.StopRecorder();
    toast.Toast.dismiss();
//    DataUtils.doUploadFile(filePath);
    if (_itemValue == _itemValue2) {
      GoogleSpeechRec(filePath, "zh-CN");
    } else if (_itemValue == _itemValue3) {
      GoogleSpeechRec(filePath, "ja-JP");
    } else {
      SpeechRec(filePath);
    }
  }

  final _credentials = new ServiceAccountCredentials.fromJson(r'''
{
  "private_key_id": "684e7077f36909c02f808c4584ca4066eade262b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDKSCDu3TMGKVwY\nF4WQ88LiJIFhUJya0U+QB6gUogsgfTfnnARGilOi2ggkR9swVSks2lOcIGFPnVfl\n+0V55HnZYd2UmHMkA6nBzRLAd/tVWj70lMGGmEPZPP5d4tUQZxBFSeyu1UBsxAWG\nvFmNtai4Ejm2friMlACkcd4iyaEqv//DMxEYYl3+KWSmae7s7T82LHQYRtuy3N8O\nH+/0HBBJ+8+MlcMzNyV3tpzD3FU5M76oz6lGMm5tvXrQv8FX4GCNQ9250ChbOWCX\nPRVMb+HPNNpiIeHXtxQ9GjZhqQ/7jKxdOL+DG13+si0EV34hH5Rve0rLb+MVJhEY\nynOXm+plAgMBAAECggEAA4UDfJHSxzRAMSkCgIUiKL6m6t7cD5jEr0SQnV6f3jdS\nNo6y+Vh1FVzINaaB3U0667SByodzl1YCjJnHR/DAEeS/cowxvAMoMXeWE+mgvyQi\nl8nLJsmSK/tIOzFbKaTCxIT6SrM/d+pXj38DFcbieUhTrVsTJ7AiyNYmQWXdx6lc\nejKAu6KLQoSGikLnMYybMnzeZQnPjHYmMVe6zoiqeuSTQ7YOo6InqZeqaFVoIHVH\nlI0lu8NY71nHsLZ7sSG0b779Fl2IQD+hMH/VKENqyfhEuU4/L4o/6JW13hAdWZMG\niVDM9qKTtVXDUjhFEYkpPp0DHP3zA2m7s9bOrppJ6QKBgQDmFI2ZS5c/VIZ1OK06\nghTUkokXv0TJ4DrDQfC5t2IRfdUYeUlqqUPoPXyHd0chrbHAnPrmXkwQkqjWXI7s\n/9h4yqCToIbz9ZmThenWASBjkoUjTojOxiQKcx7rFF2bNEE4CUDuKLysWddoXbSz\nhqOzs78kBkxGUwedSIDsXbcvfQKBgQDhEd/F26kc3YHLv+ek/lzZH2LH2TiEPqx2\nn2Um8wpGvKXycqH+2GJ86VuT2XL644O62JZkX583tvZmfj3r+/iciEDO58NIQ8BX\nuwfawJCEpFsME8kOrSZHaHizhxIHQrLX8tui6H0i8xS6sH5YU3o8t5yCHb83JwoN\nj+DLLTprCQKBgA7lV8GL/k/QViAyuixmjZixoASUkoyLYuKPW1l6wPOm9Ovvtkwc\nh1P63xwaIdXRXAe/YhMWGdCc3id6uJopekdfvwOvyezzgqzlZ50+V2165/nANOVG\nOMEgcOkBWYoZ2PsaxkRlCMoTyvlrz64r0l9pDL/1VGzdJUoOjqI+8wQ1AoGBAIIu\nh4N3KZsTmGbUqlTp96Rynf1AbIs5gSHf0m8z9saxiT7yBTdVy6m6hIjBJtttS52A\nd4S5NmvQfTcNYB2mEcfgm7PRpEehQJi+Cq4B4dWHB062Bv5hMpntGJumzcu7TZzQ\n0S+qT+8uMNhHC91k83g5L+Km+Bobj5oGlZyPnZGZAoGBALPuQSenkgWY4sAU33//\nU05PpqMoD28uGv7f2FoIvua5/OVxwu2V0HD2skzfTwJAW8Xz5CO9cxYnEJNugvi4\np8SIuVEqK+nhpG0kbm2HvbryU5PrChufrH9zXlAKgYI/PSHJdJV3r1rbGldaUEOz\nU3CdNsD8wQDQoncZfGvt/HgM\n-----END PRIVATE KEY-----\n",
  "client_email": "admin-670@brave-idea-248300.iam.gserviceaccount.com",
  "client_id": "115717819310461773766",
  "type": "service_account"
}
''');
  final _SCOPES = const [SpeechApi.CloudPlatformScope];

  //语音识别
  SpeechRec(String filepath) async {
    upload(Api.UPLOADFILE, filepath);
  }

  //谷歌语音识别
  GoogleSpeechRec(String filepath, String langCode) async {
    clientViaServiceAccount(_credentials, _SCOPES).then((http_client) {
      var speech = new SpeechApi(http_client);
      RecognizeRequest r = new RecognizeRequest();
      File file = new File(filepath);
      Future<List<int>> future = file.readAsBytes();
      future.then((value) {
        String content = BASE64.base64Encode(value);
        RecognitionAudio audio = new RecognitionAudio.fromJson(
            { 'content': content});
        r.audio = audio;
        RecognitionConfig config = new RecognitionConfig.fromJson({
          'languageCode': langCode, //'zh-CN'
          'encoding': 'LINEAR16',
          'sampleRateHertz': 16000,
        });
        r.config = config;
        speech.speech.recognize(r).then((results) {
          setState(() {
            Map result = results.toJson();
            if (result.isNotEmpty) {
              String recovalue = RecognizeResponse
                  .fromJson(result)
                  .results[0].alternatives[0].transcript;
              list.add("语音识别：$recovalue");
            } else {
              list.add("智幕君没有听清楚哦！");
            }
          });
        });
      });
    });
  }

  var dio = new Dio(BaseOptions(connectTimeout: 30000, headers: {
    'accept-language': 'zh-cn',
    'content-type': 'application/json'
  }));

  void upload(String url, String filepath) async {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    String deviceUUID;
    if (Platform.isIOS) {
      print('IOS设备：');
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceUUID = iosInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      print('Android设备');
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceUUID = androidInfo.device + androidInfo.id;
    }
    File file = new File(filepath);
    File txtfile = new File(filepath.replaceAll(".wav", ".txt"));
    String txtvalue;
    await txtfile.readAsString().then((value) {
      txtvalue = value;
    });
    Future<List<int>> future = file.readAsBytes();
    await future.then((value) async {
      String content = BASE64.base64Encode(value);
      var response = await dio.post(url, data: {
        'fs': 16000,
        'wavs': content,
        'text': txtvalue,
        'token': 'qwertasd',
        'device': deviceUUID
      });
      setState(() {
        if (response != null) {
          list.add("语音识别：$response");
        } else {
          list.add("智幕君没有听清楚哦！");
        }
        _scrollController.animateTo(list.length * _ITEM_HEIGHT,
            duration: new Duration(seconds: 2), curve: Curves.ease);
      });
    });
  }

  _StartFloatWindow() async {
    await FloatWindow.StartFlowWindow();
  }

  _InitSharedPreference() async {
    sp = await SpUtil.getInstance();
    if (sp.hasKey(_selectKey)) {
      _itemValue = sp.getString(_selectKey);
      print("itemValue=====" + _itemValue);
    }
  }

}
