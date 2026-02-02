import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taqsema/features/match/data/repos/match_repo.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit(this.matchRepo) : super(MatchInitial());

  final MatchRepo matchRepo;

  void generateTeams(List<PlayerModel> selectedPlayers) async {
    emit(MatchLoading());
    try {
      if (selectedPlayers.length < 2) {
        emit(
          const MatchFailure(errMsg: 'Not enough players selected (Minimum 2)'),
        );
        return;
      }
      final List<PlayerModel> pool = List.from(selectedPlayers);

      // Randomize the players
      pool.shuffle();

      // Calculte the half
      final int halfIndex = (pool.length / 2).ceil();

      // Split the list into 2 teams
      final teamA = pool.sublist(0, halfIndex);
      final teamB = pool.sublist(halfIndex);

      await matchRepo.saveActiveMatch(teamA, teamB);

      // Done
      emit(MatchGenerated(teamA: teamA, teamB: teamB));
    } catch (e) {
      emit(MatchFailure(errMsg: 'Error generating teams: $e'));
    }
  }

  void loadActiveMatch() {
    emit(MatchLoading());
    final activeMatch = matchRepo.getActiveMatch();

    if (activeMatch != null) {
      emit(
        MatchGenerated(
          teamA: activeMatch['team_a']!,
          teamB: activeMatch['team_b']!,
        ),
      );
    } else {
      emit(const MatchFailure(errMsg: 'No active match found'));
    }
  }

  Future<void> clearActiveMatch() async {
    await matchRepo.clearActiveMatch();
  }

  void updateTeams(List<PlayerModel> teamA, List<PlayerModel> teamB) async {
    await matchRepo.saveActiveMatch(teamA, teamB);
    emit(MatchGenerated(teamA: teamA, teamB: teamB));
  }
}
