import 'dart:math';
import 'dart:ui';

import 'package:flutter_tools/pages/game_page/src/shared_state/game/character.dart';

/// UI style properties for [Character]s. [Character] to [CharacterStyle]
/// mapping is done via [Character.id] values.
/// 这里是所有人物的介绍
class CharacterStyle {
  final String flare;
  final Color accent;
  final String name;
  final String description;

  static final Map<String, CharacterStyle> _all = {
    'jack': CharacterStyle(
        name: '应届毕业生',
        flare: 'assets/flare/TheJack.flr',
        accent: const Color.fromRGBO(29, 202, 34, 1),
        description: '遇到麻烦啦？应届毕业生来帮你，他工作非常的积极 /偷笑'),
    'sourcerer': CharacterStyle(
        name: '初级程序员',
        flare: 'assets/flare/Sourcerer.flr',
        accent: const Color.fromRGBO(82, 183, 216, 1),
        description:
            '熟练的问题解决者和程序员，能够通过遍历代码库找到任何和一些问题的答案。'),
    'refactorer': CharacterStyle(
        name: '代码重构员',
        flare: 'assets/flare/TheRefactorer.flr',
        accent: const Color.fromRGBO(75, 58, 185, 1),
        description:
            '数字德鲁伊，她在代码方面有很强的第六感，需要她来拯救你的代码吗？'
            '你的代码是由一堆复制粘贴片段组成的吗？发送重构器来清理代码库并使其blingbling！'),
    'architect': CharacterStyle(
        name: '架构师',
        flare: 'assets/flare/TheArchitect.flr',
        accent: const Color.fromRGBO(236, 41, 117, 1),
        description:
            '他可以结构化你的大型项目中的代码，从提高代码可读性和健壮性。他是一个天才，一个极客。'),
    'pm': CharacterStyle(
        name: '项目经理',
        flare: 'assets/flare/ProgramManager.flr',
        accent: const Color.fromRGBO(84, 209, 88, 1),
        description:
            '促进沟通和群体和谐。他负责协调团队，并分配团队成员项目需求，他有能力提高别人的能力。（就是在项目上打杂的）'),
    'avant_garde_designer': CharacterStyle(
        name: '前端设计师',
        flare: 'assets/flare/Designer.flr',
        accent: const Color.fromRGBO(236, 148, 0, 1),
        description:
            '通过为应用程序提供出色的设计来激励他们，从而提高团队执行力。'
            '她的设计为你的程序在用户与应用程序交互方面赢得了更多的顾客。'),
    'cowboy': CharacterStyle(
        name: '高级程序员',
        flare: 'assets/flare/CowboyCoder.flr',
        accent: const Color.fromRGBO(75, 58, 185, 1),
        description:
            '一个高产的不喜欢结构化的程序员。他能很快地写出很多代码…希望其他人能读懂他的代码。哈哈！'),
    'tester': CharacterStyle(
        name: '测试工程师',
        flare: 'assets/flare/Tester.flr',
        accent: const Color.fromRGBO(75, 58, 185, 1),
        description:
            '测试工程师本身就是一名优秀的开发人员，他为持续集成测试创建了宝贵的框架，'
            '并以闪电般的速度修复错误。（国内的测试工程师貌似没有这个能力）'),
    'uxr': CharacterStyle(
        name: '用户体验研究员',
        flare: 'assets/flare/UXResearcher.flr',
        accent: const Color.fromRGBO(222, 165, 88, 1),
        description:
            '他们设计了启发性的实验，以更好地了解用户需求，从而获得令人愉快的用户体验。'),
    'hacker': CharacterStyle(
        name: '骇客',
        flare: 'assets/flare/TheHacker.flr',
        accent: const Color.fromRGBO(236, 41, 117, 1),
        description:
            '一个强大的独立程序员，但擅长发现和修复安全缺陷，也擅长发现问题以及提供解决方案。'
            '当你读到这个描述时，她可能嗅到了你的电子邮件密码。'),
  };

  CharacterStyle(
      {this.flare, this.accent, this.name, this.description = 'N/A'});

  static CharacterStyle from(Character character) {
    return _all[character.id];
  }

  static CharacterStyle random() {
    Random rand = Random();
    return _all.values.elementAt(rand.nextInt(_all.values.length));
  }
}
