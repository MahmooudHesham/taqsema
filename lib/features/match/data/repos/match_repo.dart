import 'package:t2sema/features/match/data/models/match_model.dart';

abstract class MatchRepo {
  List<MatchModel> getAllMatches();
  Future<void> addMatch(MatchModel match);
  Future<void> deleteMatch(MatchModel match);
}
