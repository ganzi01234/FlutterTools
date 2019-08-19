import 'package:flutter/material.dart';
import './bsmap_cj_controller.dart';
import './location_page.dart';
import './cj_base.dart';
import './cj_pole.dart';

class MapFunctionPageTest extends StatefulWidget {
  @override
  _MapFunctionPageTestState createState() => _MapFunctionPageTestState();
}

class _MapFunctionPageTestState extends State<MapFunctionPageTest> {
  BsMapCJLineController _controller;
  BsCJBase _cj;
  @override
  void initState() {
    super.initState();
    _controller = BsMapCJLineController(onMessage: (method, config) {
      if (method == "click_overlay") {
        _cj.onClick(config);
      }
    });
    _cj = BsCJPole(_controller);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: LocationPage(controller: _controller)),
            Container(
              height: 100,
              child: Wrap(
                children: <Widget>[
                  OutlineButton(
                      child: Text("绘"),
                      onPressed: () async {
                        if (_controller.centerPoint == null) {
                          return;
                        }
                        await _cj.sure(config: {
                          "number": _cj.nextNumber(),
                        });
                      }),
                  OutlineButton(
                    child: Text("删"),
                    onPressed: () {
                      _cj.remove(_cj.selectedIndex());
                    },
                  ),
                  OutlineButton(
                    child: Text("前"),
                    onPressed: () {
                      _cj.setInstertDirect(BsCJBaseInsertDirect.before);
                    },
                  ),
                  OutlineButton(
                    child: Text("后"),
                    onPressed: () {
                      _cj.setInstertDirect(BsCJBaseInsertDirect.after);
                    },
                  ),
                  OutlineButton(
                    child: Text("不选"),
                    onPressed: () {
                      _cj.cancelSelect();
                    },
                  ),
                  OutlineButton(
                    child: Text("确定"),
                    onPressed: () {
                      _cj.sure();
                    },
                  ),
                  // OutlineButton(
                  //   child: Text("多页面"),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       new MaterialPageRoute(builder: (context) => PageTest()),
                  //     );
                  //   },
                  // )
                ],
              ),
            ),
            // Expanded(
            //   child: _map2.map,
            // )
          ],
        ));
  }
}
