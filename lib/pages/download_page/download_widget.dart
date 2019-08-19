import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
class DownloadUtil{
  static String localPath;

  static final _documents = [
    {
      'name': 'Android Programming Cookbook（失效链接测试）',
      'link':
      'http://enos.itcollege.ee/~jpoial/allalaadimised/reading/Android-Programming-Cookbook.pdf'
    }
  ];

  static final _images = [
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
    }
  ];

  static final _videos = [
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
  static Widget buildActionForTask(TaskInfo task) {
    if (task.status == DownloadTaskStatus.undefined) {
      return new RawMaterialButton(
        onPressed: () {
          _requestDownload(task, localPath);
        },
        child: new Icon(Icons.file_download),
        shape: new CircleBorder(),
        constraints: new BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.running) {
      return new RawMaterialButton(
        onPressed: () {
          _pauseDownload(task);
        },
        child: new Icon(
          Icons.pause,
          color: Colors.red,
        ),
        shape: new CircleBorder(),
        constraints: new BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.paused) {
      return new RawMaterialButton(
        onPressed: () {
          _resumeDownload(task);
        },
        child: new Icon(
          Icons.play_arrow,
          color: Colors.green,
        ),
        shape: new CircleBorder(),
        constraints: new BoxConstraints(minHeight: 32.0, minWidth: 32.0),
      );
    } else if (task.status == DownloadTaskStatus.complete) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new Text(
            'Ready',
            style: new TextStyle(color: Colors.green),
          ),
          RawMaterialButton(
            onPressed: () {
              _delete(task, localPath);
            },
            child: Icon(
              Icons.delete_forever,
              color: Colors.red,
            ),
            shape: new CircleBorder(),
            constraints: new BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else if (task.status == DownloadTaskStatus.canceled) {
      return new Text('Canceled', style: new TextStyle(color: Colors.red));
    } else if (task.status == DownloadTaskStatus.failed) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new Text('Failed', style: new TextStyle(color: Colors.red)),
          RawMaterialButton(
            onPressed: () {
              _retryDownload(task);
            },
            child: Icon(
              Icons.refresh,
              color: Colors.green,
            ),
            shape: new CircleBorder(),
            constraints: new BoxConstraints(minHeight: 32.0, minWidth: 32.0),
          )
        ],
      );
    } else {
      return null;
    }
  }

  static void _requestDownload(TaskInfo task, String _localPath) async {
    task.taskId = await FlutterDownloader.enqueue(
        url: task.link,
        headers: {
          "auth": "test_for_sql_encoding"
        },
        savedDir: _localPath,
        showNotification: true,
        openFileFromNotification: true);
  }

  static void _cancelDownload(TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId);
  }

  static void _pauseDownload(TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId);
  }

  static void _resumeDownload(TaskInfo task) async {
    String newTaskId = await FlutterDownloader.resume(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  static void _retryDownload(TaskInfo task) async {
    String newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  static Future<bool> openDownloadedFile(TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }

  static void _delete(TaskInfo task, String _localPath) async {
    await FlutterDownloader.remove(taskId: task.taskId, shouldDeleteContent: true);
//    await prepare(_localPath);
  }
}

class TaskInfo {
  final String name;
  final String link;

  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  TaskInfo({this.name, this.link});
}

class ItemHolder {
  final String name;
  final TaskInfo task;

  ItemHolder({this.name, this.task});
}
