import 'package:hive/hive.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
part 'match_model.g.dart';

@HiveType(typeId: 1)
class MatchModel extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final int firstScore;

  @HiveField(2)
  final int secondScore;

  @HiveField(3)
  final List<PlayerModel> teamA;

  @HiveField(4)
  final List<PlayerModel> teamB;

  MatchModel({
    required this.date,
    required this.firstScore,
    required this.secondScore,
    required this.teamA,
    required this.teamB,
  });
}
