enum MilestoneType {
  goal,
  result,
}

class Milestone {
  const Milestone({
    required this.id,
    required this.content,
    required this.reached,
    required this.toReach,
  });

  final String id;

  /// Текст с целью.
  final String content;

  /// Какой прогресс достигнут.
  final int reached;

  /// Чего нужно достигнуть.
  final int toReach;

  MilestoneType get type => reached >= toReach ? MilestoneType.result : MilestoneType.goal;
}
