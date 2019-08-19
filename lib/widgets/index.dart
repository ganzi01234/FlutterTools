//import 'elements/index.dart' as elements;
//import 'components/index.dart' as components;
import 'package:flutter/material.dart';

class WidgetDemoList  extends StatelessWidget{
  WidgetDemoList();

  List getDemos() {
    List result = [];
//    result.addAll(elements.getWidgets());
//    result.addAll(components.getWidgets());
//    result.addAll(themes.getWidgets());
    return result;
  }

  @override
  Widget build(BuildContext context) {

  }
}
