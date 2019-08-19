import 'dart:async';

import 'package:flutter_tools/pages/game_page/src/about_screen.dart';
import 'package:flutter_tools/pages/game_page/src/code_chomper/code_chomper.dart';
import 'package:flutter_tools/pages/game_page/src/game_screen.dart';
import 'package:flutter_tools/pages/game_page/src/shared_state/game/world.dart';
import 'package:flutter_tools/pages/game_page/src/shared_state/user.dart';
import 'package:flutter_tools/pages/game_page/src/style_sphinx/axis_questions.dart';
import 'package:flutter_tools/pages/game_page/src/style_sphinx/flex_questions.dart';
import 'package:flutter_tools/pages/game_page/src/style_sphinx/kittens.dart';
import 'package:flutter_tools/pages/game_page/src/style_sphinx/sphinx_image.dart';
import 'package:flutter_tools/pages/game_page/src/style_sphinx/sphinx_screen.dart';
import 'package:flutter_tools/pages/game_page/src/welcome_screen.dart';
import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
///这个是一个完全使用Flutter构建的游戏demo，用于演示，如果你不需要集成到你的程序，你可以把整个game_page删除即可。

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final World world = World();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => User()),
          ChangeNotifierProvider.value(notifier: world),
          ChangeNotifierProvider.value(notifier: world.characterPool),
          ChangeNotifierProvider.value(notifier: world.taskPool),
          ChangeNotifierProvider.value(notifier: world.company),
          ChangeNotifierProvider.value(notifier: world.company.users),
          ChangeNotifierProvider.value(notifier: world.company.joy),
          ChangeNotifierProvider.value(notifier: world.company.coin),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          //去掉debug logo
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.orange,
              canvasColor: Colors.transparent),
          routes: {
            '/': (context) => WelcomeScreen(),
            '/gameloop': (context) => GameScreen(),
            '/about': (context) => AboutScreen(),
            CodeChomper.miniGameRouteName: (context) {
              String filename =
                  ModalRoute.of(context).settings.arguments as String;
              return CodeChomper(filename);
            },
            SphinxScreen.miniGameRouteName: (context) => const SphinxScreen(),
            SphinxScreen.fullGameRouteName: (context) =>
                const SphinxScreen(fullGame: true),
            ColumnQuestion.routeName: (context) => const ColumnQuestion(),
            RowQuestion.routeName: (context) => const RowQuestion(),
            StackQuestion.routeName: (context) => const StackQuestion(),
            MainAxisCenterQuestion.routeName: (context) =>
                const MainAxisCenterQuestion(),
            MainAxisSpaceAroundQuestion.routeName: (context) =>
                const MainAxisSpaceAroundQuestion(),
            MainAxisSpaceBetweenQuestion.routeName: (context) =>
                const MainAxisSpaceBetweenQuestion(),
            MainAxisStartQuestion.routeName: (context) =>
                const MainAxisStartQuestion(),
            MainAxisEndQuestion.routeName: (context) =>
                const MainAxisEndQuestion(),
            MainAxisSpaceEvenlyQuestion.routeName: (context) =>
                const MainAxisSpaceEvenlyQuestion(),
            RowMainAxisEndQuestion.routeName: (context) =>
                const RowMainAxisEndQuestion(),
            RowMainAxisStartQuestion.routeName: (context) =>
                const RowMainAxisStartQuestion(),
            RowMainAxisSpaceBetween.routeName: (context) =>
                const RowMainAxisSpaceBetween(),
          },
        ));
  }

  @override
  void initState() {
    // Don't prune the Flare cache, keep loaded Flare files warm and ready
    // to be re-displayed.
    FlareCache.doesPrune = false;
    // Schedule a microtask that warms up the image cache with all of the style
    // sphinx images. This will run after the build method is executed, but
    // before the style sphinx is displayed.
    scheduleMicrotask(() {
      precacheImage(SphinxScreen.pyramid, context);
      precacheImage(SphinxScreen.background, context);
      precacheImage(SphinxImage.provider, context);
      precacheImage(SphinxWithoutGlassesImage.provider, context);
      precacheImage(SphinxGlassesImage.provider, context);
      precacheImage(KittyBed.redProvider, context);
      precacheImage(KittyBed.greenProvider, context);
      precacheImage(Kitty.orangeProvider, context);
      precacheImage(Kitty.yellowProvider, context);
    });
    super.initState();
  }

  @override
  void dispose() {
    if(world!=null){
      world.dispose();
    }
    super.dispose();
  }
}
