part of task_tree;

const _geolocation = TaskBlueprint(
  '地理定位',
  {Skill.engineering: 100, Skill.coding: 50},
  coinReward: 300,
  requirements: AllOf([_alpha]),
);

const _arMessages = TaskBlueprint(
  'AR消息',
  {Skill.engineering: 50, Skill.coding: 100},
  coinReward: 300,
  requirements: AllOf([_geolocation]),
);
