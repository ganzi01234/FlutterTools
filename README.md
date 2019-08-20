# FlutterTools简介
一个包含了常用APP开发模块的Flutter框架程序，你可以基于此程序快速进行Flutter开发。

# 写在开头
作者在学习Flutter开发的过程中遇到很多问题，从http://pub.dev 上面引入第三方包遇到的各种问题，Flutter程序配置问题等等，现总结以往的APP开发经验，程序集成了常用的APP第三方开发包，把我觉得比较好用的开发包做一个整理，制作成一个FlutterTools项目框架来给想要Flutter开发的同学们快速上手开发工作。也把我开发过程遇到的一些坑给广大的开发者踩一遍，希望后来的可以避免这些坑。
# Flutter环境配置
  作者是参考了这些文章进行环境配置，在这里写出来，免得大家走弯路去寻找  
  [Flutter配置在AndroidStudio最新教程](https://blog.csdn.net/qq_37199105/article/details/81007683)  
  [查看 flutter 安装其它依赖项遇到的问题](https://blog.csdn.net/langzxz/article/details/80933515)  
  作者遇到的坑，作者使用win8.1支持的powershell版本太低。需要重新更新安装windows update，[下载地址](https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win8.1AndW2K12R2-KB3191564-x64.msu)，他会启动一个windows 更新程序，下载一些更新，耗时很长。  
  建议使用AS3.0-3.1，Flutter v23.2.1插件竟然不支持AS3.4版本。/吐槽
# 集成的包
  #### 基础模块：  
  http网络请求-使用dio的默认网络请求框架  
  本地存储-使用[sqflite](https://pub.dev/packages/sqflite)和[shared_preferences](https://pub.dev/packages/shared_preferences)  
  路由路径-使用[fluro](https://pub.dev/packages/fluro)  
  调用SMS或EMAIL等基础功能-[url_launcher](https://pub.dev/packages/url_launcher)  

  #### 功能模块：  
  语音识别（[record_wav](https://pub.dev/packages/recorder_wav)，后端采用[ARST语言识别系统](https://github.com/nl8590687/ASRT_SpeechRecognition)(经过作者改良，改良源码暂未公开，有兴趣可以联系作者)，也采用了谷歌语音识别（[google cloud speech api](https://pub.dev/packages/googleapis)，需要翻墙，支持中文日文））  
  拍照和本地相册读取照片（[image_picker](https://pub.dev/packages/image_picker)）  
  二维码识别（[flutter_mobile_vision_jamel](https://pub.dev/packages/flutter_mobile_vision_jamel)）  
  Webview（[flutter_webview_plugin](https://pub.dev/packages/flutter_webview_plugin)）  
  阿里支付（[flutter_alipay](https://pub.dev/packages/flutter_alipay)），这个库支付回调如果错误会报空指针的crash，希望下个版本改进，或者可以换其他库  
  微信SDK（[flutter_wechat](https://pub.dev/packages/flutter_wechat)）  
  百度地图（[fm_baidu_map](https://pub.dev/packages/fm_baidu_map)）  
  谷歌Admob（[firebase_admob](https://pub.dev/packages/firebase_admob)）  
  游戏Developer Quest--这是一个完全使用Flutter开发的小游戏，很酷。。   
  以上是项目中集成的第三方包，基本在现有的APP开发中够用，作者都是采用模块化，你不需要的模块可以按照项目中的说明来删除即可。不会影响到其他模块使用。
# FlutterTools使用说明
  按照环境配置文章配置好，导入包==>run configurations中配置main.dart==>Dart entrypoint指向FlutterTools-master\lib\main.dart。
  即可使用FlutterTools
  #### 关于Android
  已经在我本机上面实现android打包，除支付宝功能外，其他功能正常。
  #### 关于IOS
  待实现。。。
  
# 感谢
  [Flutter-Go](https://github.com/alibaba/flutter-go)
# 问题答疑
  作者QQ:943161100
