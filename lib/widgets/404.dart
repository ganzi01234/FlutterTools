import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text("页面不见了"),
          ),
          body: Container(
              child:  Text("页面不见了")
          )
      );
    }
}
