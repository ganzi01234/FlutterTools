import 'package:flutter_tools/pages/game_page/src/shared_state/game/skill.dart';
import 'package:flutter_tools/pages/game_page/src/style.dart';
import 'package:flutter/material.dart';

/// Displays a skill as a colored dot.
class SkillDot extends StatelessWidget {
  final Skill skill;

  const SkillDot(this.skill);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: skillColor[skill],
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
