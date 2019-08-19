import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_tools/pages/download_page/download_widget.dart';
import 'dart:io';
import 'package:permission/permission.dart';

class DownloadPage extends StatefulWidget {

  DownloadPage(this.title) : super();

  final String title;

  @override
  _DownloadPageState createState() => new _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage>
    with WidgetsBindingObserver {
  final _downloadItem = [
    {
      'name': 'Android Programming Cookbook（失效链接测试）',
      'link':
      'http://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf'
    },
    {
      'name': 'Arches National Park',
      'link':
      'https://upload.wikimedia.org/wikipedia/commons/6/60/The_Organ_at_Arches_National_Park_Utah_Corrected.jpg'
    },
    {
      'name': 'Canyonlands National Park',
      'link':
      'https://upload.wikimedia.org/wikipedia/commons/7/78/Canyonlands_National_Park%E2%80%A6Needles_area_%286294480744%29.jpg'
    },
    {
      'name': 'Death Valley National Park',
      'link':
      'https://upload.wikimedia.org/wikipedia/commons/b/b2/Sand_Dunes_in_Death_Valley_National_Park.jpg'
    },
    {
      'name': 'Gates of the Arctic National Park and Preserve',
      'link':
      'https://upload.wikimedia.org/wikipedia/commons/e/e4/GatesofArctic.jpg'
    },
    {
      'name': '小鸟动画片',
      'link':
      'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4'
    },
    {
      'name': '鲸鱼纪录片',
      'link':
      'http://vjs.zencdn.net/v/oceans.mp4'
    }
  ];

  List<TaskInfo> _tasks;
  List<ItemHolder> _items;
  bool _isLoading;
  bool _permissisonReady;
  String _localPath;

  @override
  void initState() {
    super.initState();

    FlutterDownloader.registerCallback((id, status, progress) {
      final task = _tasks.firstWhere((task) => task.taskId == id);
      setState(() {
        task?.status = status;
        task?.progress = progress;
      });
    });

    _isLoading = true;
    _permissisonReady = false;

    _initDownload();
  }

  void _initDownload() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    _localPath = directory.path + '/Download';
    DownloadUtil.localPath = _localPath;
    prepare(_localPath);
  }

  Future<String> prepare(String localPath) async {
    final tasks = await FlutterDownloader.loadTasks();

    int count = 0;
    _tasks = [];
    _items = [];

    _tasks.addAll(_downloadItem.map((document) =>
        TaskInfo(name: document['name'], link: document['link'])));

    _items.add(ItemHolder(name: 'Documents'));
    for (int i = count; i < _tasks.length; i++) {
      _items.add(ItemHolder(name: _tasks[i].name, task: _tasks[i]));
      count++;
    }

//    _tasks.addAll(_images
//        .map((image) => TaskInfo(name: image['name'], link: image['link'])));
//
//    _items.add(ItemHolder(name: 'Images'));
//    for (int i = count; i < _tasks.length; i++) {
//      _items.add(ItemHolder(name: _tasks[i].name, task: _tasks[i]));
//      count++;
//    }
//
//    _tasks.addAll(_videos
//        .map((video) => TaskInfo(name: video['name'], link: video['link'])));
//
//    _items.add(ItemHolder(name: 'Videos'));
//    for (int i = count; i < _tasks.length; i++) {
//      _items.add(ItemHolder(name: _tasks[i].name, task: _tasks[i]));
//      count++;
//    }

    tasks?.forEach((task) {
      for (TaskInfo info in _tasks) {
        if (info.link == task.url) {
          info.taskId = task.taskId;
          info.status = task.status;
          info.progress = task.progress;
        }
      }
    });
    _permissisonReady = await checkPermission();
    print("_permissisonReady============"+_permissisonReady.toString());
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<bool> checkPermission() async {
    if (Platform.isAndroid) {
      var permissionNames = await Permission.requestPermissions(
          [PermissionName.Storage]);
      if (permissionNames[0] == PermissionStatus.deny) {
        print("_permissisonReady====================false");
        return false;
      } else {
        print("_permissisonReady====================true");
        return true;
      }
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    FlutterDownloader.registerCallback(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Builder(
          builder: (context) =>
          _isLoading
              ? new Center(
            child: new CircularProgressIndicator(),
          )
              : _permissisonReady
              ? new Container(
            child: new ListView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              children: _items
                  .map((item) =>
              item.task == null
                  ? new Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 18.0),
                ),
              )
                  : new Container(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 8.0),
                child: InkWell(
                  onTap: item.task.status ==
                      DownloadTaskStatus.complete
                      ? () {
                    DownloadUtil.openDownloadedFile(item.task)
                        .then((success) {
                      if (!success) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(
                            content: Text(
                                'Cannot open this file')));
                      }
                    });
                  }
                      : null,
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        width: double.infinity,
                        height: 64.0,
                        child: new Row(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: <Widget>[
                            new Expanded(
                              child: new Text(
                                item.name,
                                maxLines: 1,
                                softWrap: true,
                                overflow:
                                TextOverflow.ellipsis,
                              ),
                            ),
                            new Padding(
                              padding:
                              const EdgeInsets.only(
                                  left: 8.0),
                              child: DownloadUtil.buildActionForTask(
                                  item.task),
                            ),
                          ],
                        ),
                      ),
                      item.task.status ==
                          DownloadTaskStatus
                              .running ||
                          item.task.status ==
                              DownloadTaskStatus.paused
                          ? new Positioned(
                        left: 0.0,
                        right: 0.0,
                        bottom: 0.0,
                        child:
                        new LinearProgressIndicator(
                          value: item.task.progress /
                              100,
                        ),
                      )
                          : new Container()
                    ]
                        .where((child) => child != null)
                        .toList(),
                  ),
                ),
              ))
                  .toList(),
            ),
          )
              : new Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Please grant accessing storage permission to continue -_-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blueGrey, fontSize: 18.0),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  FlatButton(
                      onPressed: () {
                        checkPermission().then((hasGranted) {
                          setState(() {
                            _permissisonReady = hasGranted;
                          });
                        });
                      },
                      child: Text(
                        'Retry',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}


