part of task_tree;

const _basicDesign = TaskBlueprint(
  '原型',
  {Skill.ux: 100, Skill.coordination: 50},
  requirements: AllOf([_alpha]),
  priority: 50,
);

const _dinosaurMascot = TaskBlueprint(
  '恐龙吉祥物和图标',
  {Skill.coordination: 100, Skill.ux: 50},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Bird Mascot & Icon', 'Cat Mascot & Icon'],
  priority: 10,
);

const _birdMascot = TaskBlueprint(
  '鸟吉祥物和图标',
  {Skill.coordination: 100, Skill.ux: 50},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Cat Mascot & Icon', 'Dinosaur Mascot & Icon'],
  priority: 10,
);

const _catMascot = TaskBlueprint(
  '猫吉祥物和图标',
  {Skill.coordination: 100, Skill.ux: 50},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Bird Mascot & Icon', 'Dinosaur Mascot & Icon'],
  priority: 10,
);

const _retroDesign = TaskBlueprint(
  '复古设计',
  {Skill.ux: 100},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Sci-Fi Design', 'Mainstream Design'],
  priority: 10,
);

const _scifiDesign = TaskBlueprint(
  '科幻设计',
  {Skill.ux: 100},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Retro Design', 'Mainstream Design'],
  priority: 10,
);

const _mainstreamDesign = TaskBlueprint(
  '主流设计',
  {Skill.ux: 50},
  coinReward: 250,
  requirements: AllOf([_basicDesign]),
  mutuallyExclusive: ['Sci-Fi Design', 'Retro Design'],
  priority: 10,
);
