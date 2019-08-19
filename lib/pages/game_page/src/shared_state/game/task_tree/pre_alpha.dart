part of task_tree;

const _prototype = TaskBlueprint(
  '原型',
  {Skill.coding: 30},
  requirements: none,
);

const _basicBackend = TaskBlueprint(
  '后端',
  {Skill.coding: 100},
  coinReward: 100,
  requirements: AllOf([_prototype]),
  priority: 10,
);

const _basicUI = TaskBlueprint(
  'UI设计',
  {Skill.ux: 100},
  coinReward: 100,
  requirements: AllOf([_prototype]),
  mutuallyExclusive: ['Programmer Art UI'],
);

const _programmerArtUI = TaskBlueprint(
  '产品设计',
  {Skill.coding: 100},
  requirements: AllOf([_prototype]),
  mutuallyExclusive: ['Basic UI'],
);

const _alpha =
    TaskBlueprint('生产版本', {Skill.coordination: 100, Skill.coding: 100},
        requirements: AllOf([
          AnyOf([_programmerArtUI, _basicUI]),
          _basicBackend,
        ]),
        priority: 100,
        coinReward: 500,
        miniGame: MiniGame.chomp);
