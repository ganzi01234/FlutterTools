part of task_tree;

const _uxTesting = TaskBlueprint(
  '用户体验测试',
  {Skill.ux: 100},
  coinReward: 120,
  requirements: AllOf([_alpha]),
);

const _foreignLanguageUx = TaskBlueprint(
  '外语用户体验',
  {Skill.ux: 100},
  coinReward: 120,
  requirements: AllOf([_uxTesting]),
);

const _accessibilityUx = TaskBlueprint(
  '可访问用户体验',
  {Skill.ux: 100},
  coinReward: 120,
  requirements: AllOf([_uxTesting]),
);

const _internationalization = TaskBlueprint(
  '国际化',
  {Skill.coding: 100, Skill.engineering: 100, Skill.coordination: 50},
  requirements: AllOf([_foreignLanguageUx]),
  coinReward: 120,
);

const _accessibility = TaskBlueprint(
  '易用性体验',
  {Skill.coding: 100, Skill.engineering: 10, Skill.coordination: 50},
  requirements: AllOf([_accessibilityUx]),
  coinReward: 120,
);
