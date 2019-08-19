import 'package:flutter_tools/pages/game_page/src/rpg_layout_builder.dart';
import 'package:flutter_tools/pages/game_page/src/style.dart';
import 'package:flutter_tools/pages/game_page/src/widgets/buttons/welcome_button.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const double _horizontalPadding = 33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints(minWidth: double.infinity),
        color: contentColor,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom + 33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ButtonTheme(
                  minWidth: 0,
                  child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    shape: null,
                    onPressed: () => Navigator.pop(context, null),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: modalMaxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 41),
                        const Text(
                          'FLUTTER\nDEVELOPER QUEST(汉化版)',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensedBold',
                              fontSize: 30,
                              letterSpacing: 5),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 2,
                          color: Colors.white.withOpacity(0.19),
                        ),
                        const SizedBox(height: 27),
                        Text(
                          'V 1.0',
                          style: buttonTextStyle.apply(
                              fontSizeDelta: -4,
                              color: Colors.white.withOpacity(0.5)),
                        ),
                        const SizedBox(height: 23),
                        const Text(
                          'Flutter Developer Quest is built '
                          'with Flutter by 2Dimensions.'
                              '\n翻译：ganyizhi',
                          style: TextStyle(
                              fontFamily: 'RobotoRegular', fontSize: 20),
                        ),
                        const SizedBox(height: 23),
                        const Text(
                          '图像动画基于Flare构建。 ',
                          style: TextStyle(
                              fontFamily: 'RobotoRegular', fontSize: 20),
                        ),
                        RpgLayoutBuilder(
                          builder: (context, layout) => layout != RpgLayout.slim
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 58),
                                  child: FractionallySizedBox(
                                    widthFactor: 0.5,
                                    child: WelcomeButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      background:
                                          Colors.white.withOpacity(0.15),
                                      label: '完成',
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _horizontalPadding,
                ),
                child: RpgLayoutBuilder(
                  builder: (context, layout) => layout == RpgLayout.slim
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '设计',
                              style: TextStyle(
                                  fontFamily: 'MontserratMedium', fontSize: 12),
                            ),
                            const SizedBox(height: 11),
                            Image.asset('assets/images/2dimensions.png'),
                            const SizedBox(height: 32),
                            const Text(
                              '创建由',
                              style: TextStyle(
                                  fontFamily: 'MontserratMedium', fontSize: 12),
                            ),
                            const SizedBox(height: 11),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/flutter_logo.png',
                                    height: 45, width: 37),
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Flutter',
                                    style: TextStyle(
                                        fontSize: 26,
                                        color: Colors.white.withOpacity(0.85)),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Image.asset('assets/images/flutter_logo.png',
                                height: 64, width: 52),
                            const SizedBox(width: 17),
                            Text(
                              'Flutter',
                              style: TextStyle(
                                  fontSize: 33,
                                  color: Colors.white.withOpacity(0.85)),
                            ),
                            const SizedBox(width: 80),
                            Image.asset('assets/images/flare_logo.png',
                                height: 46, width: 84),
                            const SizedBox(width: 15),
                            Text(
                              'Flare',
                              style: TextStyle(
                                  fontSize: 33,
                                  color: Colors.white.withOpacity(0.85)),
                            ),
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '设计由',
                                  style: TextStyle(
                                      fontFamily: 'MontserratMedium',
                                      fontSize: 12),
                                ),
                                const SizedBox(height: 11),
                                Image.asset(
                                    'assets/images/2dimensions_wide.png'),
                              ],
                            )
                          ],
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
