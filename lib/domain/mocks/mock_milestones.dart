// Project imports:
import 'package:treearth/domain/mocks/mock_uuid.dart';
import 'package:treearth/domain/models/milestone/milestone.dart';

final allMockMilestones = [mockMilestone1, mockMilestone2, mockMilestone3, mockMilestone4];

final mockMilestone1 = Milestone(id: uuid.v4(), content: 'Посадить 100 деревьев', reached: 50, toReach: 100);
final mockMilestone2 = Milestone(id: uuid.v4(), content: 'Открыть 1000 точек посадки', reached: 789, toReach: 1000);
final mockMilestone3 = Milestone(id: uuid.v4(), content: 'Убрать 50 точек мусора', reached: 50, toReach: 50);
final mockMilestone4 = Milestone(id: uuid.v4(), content: 'Открыть точки в 2-х городах', reached: 1, toReach: 2);
