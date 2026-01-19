import 'package:hive/hive.dart';
import 'package:t2sema/core/utils/constants.dart';
import 'package:t2sema/features/match/data/models/match_model.dart';
import 'package:t2sema/features/match/data/repos/match_repo.dart';

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
}
