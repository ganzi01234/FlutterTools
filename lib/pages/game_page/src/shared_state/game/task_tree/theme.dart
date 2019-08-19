part of task_tree;

const _basicTheme = TaskBlueprint(
  '基本主题',
  {Skill.ux: 100, Skill.coordination: 50},
  requirements: AllOf([_alpha]),
  coinReward: 250,
  priority: 50,
);

const _greenTheme = TaskBlueprint(
  '绿色主题',
  {Skill.ux: 50},
  requirements: AllOf([_basicTheme]),
  mutuallyExclusive: ['Red Theme', 'Blue Theme'],
  coinReward: 250,
  priority: 10,
);

const _redTheme = TaskBlueprint(
  '红色主题',
  {Skill.ux: 50},
  requirements: AllOf([_basicTheme]),
  mutuallyExclusive: ['Green Theme', 'Blue Theme'],
  coinReward: 250,
  priority: 10,
);

const _blueTheme = TaskBlueprint(
  '蓝色主题',
  {Skill.ux: 50},
  requirements: AllOf([_basicTheme]),
  mutuallyExclusive: ['Green Theme', 'Red Theme'],
  coinReward: 250,
  priority: 10,
);
