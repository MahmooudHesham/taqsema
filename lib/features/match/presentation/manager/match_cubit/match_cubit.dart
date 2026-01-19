import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      }
      final List<PlayerModel> pool = List.from(selectedPlayers);

      // Randomize the players
      pool.shuffle();

      // Calculte the half
      final int halfIndex = (pool.length / 2).ceil();

      // Split the list into 2 teams
      final teamA = pool.sublist(0, halfIndex);
      final teamB = pool.sublist(halfIndex);

      // Done
      emit(MatchGenerated(teamA: teamA, teamB: teamB));
    } catch (e) {
      emit(MatchFailure(errMsg: "Error generating teams: $e"));
    }
  }
}
