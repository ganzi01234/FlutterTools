part of task_tree;

const _simpleImageMessaging = TaskBlueprint(
  '简单图片设计',
  {Skill.engineering: 100, Skill.coding: 50, Skill.ux: 50},
  coinReward: 200,
  requirements: AllOf([_alpha]),
);

const _animatedGifSupport = TaskBlueprint(
  '动画支持',
  {Skill.engineering: 50, Skill.coding: 100},
  coinReward: 200,
  requirements: AllOf([_simpleImageMessaging]),
);

const _backendImageProcessing = TaskBlueprint(
  '后端图像处理',
  {Skill.engineering: 50, Skill.coding: 100},
  coinReward: 200,
  requirements: AllOf([_simpleImageMessaging, _backendInfrastructure]),
);

const _memeGenerator = TaskBlueprint(
  '搞笑图片制作',
  {Skill.coding: 50, Skill.ux: 50, Skill.coordination: 50},
  coinReward: 200,
  requirements: AllOf([_simpleImageMessaging, _backendImageProcessing]),
);

const _imageFilters = TaskBlueprint(
  '图像过滤器',
  {Skill.coding: 50, Skill.ux: 50},
  coinReward: 200,
  requirements: AllOf([_backendImageProcessing, _backendInfrastructure]),
);
