part of task_tree;

const _naturalLanguageGeneration = TaskBlueprint(
  '自然语言生成',
  {Skill.engineering: 100, Skill.coding: 100},
  coinReward: 350,
  requirements: AllOf([_alpha]),
);

const _naturalLanguageUnderstanding = TaskBlueprint(
  '自然语言理解',
  {Skill.engineering: 200, Skill.coding: 100},
  coinReward: 350,
  requirements: AllOf([_alpha]),
);

const _automatedBots = TaskBlueprint(
  '自动化机器人程序',
  {Skill.coding: 100, Skill.ux: 50},
  coinReward: 350,
  requirements: AllOf([_naturalLanguageGeneration]),
);

const _conversationalChatbots = TaskBlueprint(
  '聊天室',
  {Skill.coding: 200, Skill.ux: 50},
  coinReward: 350,
  requirements:
      AllOf([_naturalLanguageGeneration, _naturalLanguageUnderstanding]),
);
