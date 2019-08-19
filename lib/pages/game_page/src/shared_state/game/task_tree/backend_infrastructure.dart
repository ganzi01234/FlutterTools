part of task_tree;

const _backendInfrastructure = TaskBlueprint(
  '基础架构',
  {Skill.engineering: 100, Skill.coding: 100},
  coinReward: 200,
  requirements: AllOf([_alpha]),
);

const _fastBackend = TaskBlueprint(
  '后端',
  {Skill.coding: 100},
  coinReward: 250,
  requirements: AllOf([_backendInfrastructure]),
);

const _scalableBackend = TaskBlueprint(
  '可扩展后端',
  {Skill.coding: 100},
  coinReward: 250,
  requirements: AllOf([_backendInfrastructure]),
);
