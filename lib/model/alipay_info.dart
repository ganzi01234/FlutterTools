class AlipayInfo {
  int code;
  String msg;
  String prePayOrderInfo;
  int timestamp;

  AlipayInfo({
    this.code,
    this.msg,
    this.prePayOrderInfo,
    this.timestamp,
  });

  factory AlipayInfo.fromJson(Map<String, dynamic> json) {
    return AlipayInfo(
        code: json['code'],
        msg: json['msg'],
        prePayOrderInfo: json['data']['prePayOrderInfo'],
        timestamp: json['timestamp']
    );
  }
}
