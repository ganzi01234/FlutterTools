part of task_tree;

const _responsiveDesign = TaskBlueprint(
  '响应式设计',
  {Skill.ux: 100, Skill.coordination: 50, Skill.engineering: 50},
  requirements: AllOf([_basicDesign]),
  coinReward: 150,
);

const _tabletUI = TaskBlueprint(
  '平板UI',
  {Skill.ux: 100, Skill.coding: 50},
  requirements: AllOf([_basicDesign]),
  coinReward: 150,
);

const _desktopUI = TaskBlueprint(
  '桌面UI',
  {Skill.ux: 100, Skill.coding: 50},
  requirements: AllOf([_basicDesign]),
  coinReward: 250,
);

const _iOSDesign = TaskBlueprint(
  'iOS程序设计',
  {Skill.ux: 100, Skill.coding: 50},
  requirements: AllOf([_basicDesign]),
  coinReward: 150,
);

const _webVersion = TaskBlueprint(
  'Web版本',
  {Skill.coding: 100, Skill.ux: 50},
  requirements: AllOf([_desktopUI]),
  coinReward: 350,
);

const _desktopVersion = TaskBlueprint(
  '桌面版本',
  {Skill.coding: 100, Skill.ux: 50},
  requirements: AllOf([_desktopUI]),
  coinReward: 350,
);
