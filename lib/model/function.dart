import 'package:flutter/material.dart';

abstract class FunInterface{
    String get id;
    //功能名称
    String get name;
    //描述
    String get desc;
    //icon
    Icon get icon;
    //icon
    WidgetBuilder get buildRouter;
}

class Func implements FunInterface {
  final String id;
  final String name;
  final String desc;
  final Icon icon;
  final WidgetBuilder buildRouter;

  const Func(
      [ this.id,
        this.name,
        this.desc,
        this.icon,
        this.buildRouter])
      : super();

//  Function.fromJSON(Map json)
//      : id = json['id'],
//        name = json['name'],
//        desc = json['desc'];

  String toString() {
    return '(Function $name)';
  }

}
