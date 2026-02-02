import 'package:hive/hive.dart';
import 'package:taqsema/core/utils/constants.dart';
import 'package:taqsema/features/match/data/models/match_model.dart';
import 'package:taqsema/features/match/data/repos/match_repo.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

class MatchRepoImpl extends MatchRepo {
  @override
  Future<void> addMatch(MatchModel match) async {
    var box = Hive.box<MatchModel>(kMatchesBox);
    await box.add(match);
  }

  @override
  Future<void> deleteMatch(MatchModel match) async {
    await match.delete();
  }

  @override
  List<MatchModel> getAllMatches() {
    var box = Hive.box<MatchModel>(kMatchesBox);
    return box.values.toList();
  }

  @override
  Future<void> clearActiveMatch() async {
    final box = Hive.box(kActiveMatchBox);
    await box.clear();
  }

  @override
  Map<String, List<PlayerModel>>? getActiveMatch() {
    final box = Hive.box(kActiveMatchBox);

    if (box.isEmpty) return null;

    final dynamic teamARaw = box.get('team_a');
    final dynamic teamBRaw = box.get('team_b');

    if (teamARaw == null || teamBRaw == null) return null;

    return {
      'team_a': List<PlayerModel>.from(teamARaw),
      'team_b': List<PlayerModel>.from(teamBRaw),
    };
  }

  @override
  Future<void> saveActiveMatch(
    List<PlayerModel> teamA,
    List<PlayerModel> teamB,
  ) async {
    final box = Hive.box(kActiveMatchBox);
    await box.put('team_a', teamA);
    await box.put('team_b', teamB);
  }
}
