class Api{
   static const String BASE_URL = 'http://127.0.0.1:6001/';

  static const String DO_LOGIN = BASE_URL+'doLogin';//登陆

  static const String CHECK_LOGIN = BASE_URL+'checkLogin';//验证登陆
  
  static const String LOGOUT = BASE_URL+'logout';//退出登陆

  static const String VERSION = BASE_URL+'getAppVersion';//检查版本

   static const String UPLOADFILE = 'http://47.107.71.125:20000/';//上传录音文件http://47.107.71.125:20000/   本地http://10.209.12.194:20000/

   static const String ALIPAY = 'http://47.107.71.125:8080/payDemo/api/pay/createPayOrder';//创建订单
}