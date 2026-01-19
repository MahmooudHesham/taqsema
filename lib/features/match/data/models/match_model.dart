import 'package:t2sema/features/players/data/models/player_model.dart';

class MatchModel {
  final String date;
  final int firstScore;
  final int secondScore;
  final List<PlayerModel> teamA;
  final List<PlayerModel> teamB;

  const MatchModel({
    required this.date,
    required this.firstScore,
    required this.secondScore,
    required this.teamA,
    required this.teamB,
  });
}
