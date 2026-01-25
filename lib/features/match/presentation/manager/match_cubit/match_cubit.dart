import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:t2sema/core/utils/constants.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';

part 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  MatchCubit() : super(MatchInitial());

  void generateTeams(List<PlayerModel> selectedPlayers) {
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

      // Save to Hive
      final box = Hive.box(kActiveMatchBox);
      box.put('team_a', teamA);
      box.put('team_b', teamB);

      // Done
      emit(MatchGenerated(teamA: teamA, teamB: teamB));
    } catch (e) {
      emit(MatchFailure(errMsg: "Error generating teams: $e"));
    }
  }

  void loadActiveMatch() {
    emit(MatchLoading());
    try {
      final box = Hive.box(kActiveMatchBox);
      if (box.isEmpty) {
        emit(const MatchFailure(errMsg: "No active match found"));
        return;
      }

      final dynamic teamARaw = box.get('team_a');
      final dynamic teamBRaw = box.get('team_b');

      if (teamARaw != null && teamBRaw != null) {
        final teamA = List<PlayerModel>.from(teamARaw);
        final teamB = List<PlayerModel>.from(teamBRaw);
        emit(MatchGenerated(teamA: teamA, teamB: teamB));
      } else {
        emit(const MatchFailure(errMsg: "Error loading match data"));
      }
    } catch (e) {
      emit(MatchFailure(errMsg: "Error loading match: $e"));
    }
  }

  Future<void> clearActiveMatch() async {
    final box = Hive.box(kActiveMatchBox);
    await box.clear();
  }
}
