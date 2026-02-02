import 'package:taqsema/features/match/data/models/match_model.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

abstract class MatchRepo {
  List<MatchModel> getAllMatches();
  Future<void> addMatch(MatchModel match);
  Future<void> deleteMatch(MatchModel match);
  Future<void> saveActiveMatch(
    List<PlayerModel> teamA,
    List<PlayerModel> teamB,
  );
  Map<String, List<PlayerModel>>? getActiveMatch();
  Future<void> clearActiveMatch();
}
