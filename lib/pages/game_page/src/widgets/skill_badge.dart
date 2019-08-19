import 'package:flutter_tools/pages/game_page/src/shared_state/game/skill.dart';
import 'package:flutter_tools/pages/game_page/src/style.dart';
import 'package:flutter_tools/pages/game_page/src/widgets/flare/skill_icon.dart';
import 'package:flutter/material.dart';

Map<Skill, String> skillDisplayName = {
  Skill.coding: '编码',
  Skill.engineering: '软件工程',
  Skill.ux: 'UI设计',
  Skill.coordination: '团队协作'
};

/// Displays a skill in a nicely readable format along with
/// the value if present.
/// 显示技能树
class SkillBadge extends StatelessWidget {
  final Skill skill;

  const SkillBadge(this.skill);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: skillColor[skill],
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Row(
          children: [
            SkillIcon(skill),
            const SizedBox(width: 5),
            Text(
              skillDisplayName[skill].toUpperCase(),
              style:
                  buttonTextStyle.apply(fontSizeDelta: -4, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
