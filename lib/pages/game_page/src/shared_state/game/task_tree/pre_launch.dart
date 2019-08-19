part of task_tree;

const _backendPerformanceOptimization = TaskBlueprint(
  '后端性能优化',
  {Skill.engineering: 100, Skill.coding: 100},
  requirements: AllOf([_beta, _fastBackend]),
  coinReward: 350,
  priority: 50,
);

const _backendScalabilityOptimization = TaskBlueprint(
  '后端可扩展性优化',
  {Skill.engineering: 100, Skill.coding: 100},
  requirements: AllOf([_beta, _scalableBackend]),
  coinReward: 350,
  priority: 50,
);

const _prelaunchMarketing = TaskBlueprint(
  '售前调研',
  {Skill.coordination: 100},
  requirements: AllOf([_beta]),
  coinReward: 350,
  priority: 50,
);

const _backendHardening = TaskBlueprint(
  '后端强化',
  {Skill.engineering: 100, Skill.coding: 100},
  requirements: AllOf([_beta]),
  coinReward: 350,
  priority: 50,
);

const _uiPerformanceOptimization = TaskBlueprint(
  '用户界面性能优化',
  {Skill.coding: 100, Skill.ux: 50},
  requirements: AllOf([_beta]),
  coinReward: 350,
  priority: 50,
);

const _uiPolish = TaskBlueprint(
  'UI优化',
  {Skill.coding: 100, Skill.ux: 100},
  requirements: AllOf([_beta]),
  coinReward: 350,
  priority: 50,
);
