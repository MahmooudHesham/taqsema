import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/data/repos/players_repo.dart';
import 'package:uuid/uuid.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit(this.playersRepo) : super(PlayersInitial());

  final PlayersRepo playersRepo;
  Set<String> _currentSelection = {};

  Future<void> fetchAllPlayers() async {
    if (state is! PlayersSuccess) {
      emit(PlayersLoading());
    }
    try {
      List<PlayerModel> players = await playersRepo.getAllPlayers();

      if (players.isEmpty) {
        emit(PlayersEmpty());
        return;
      }

      final allPlayersId = players.map((e) => e.id).toSet();
      _currentSelection.removeWhere((id) => !allPlayersId.contains(id));
      
      final sortedPlayers = _sortPlayers(players, _currentSelection);
      emit(PlayersSuccess(players: sortedPlayers, selectedId: _currentSelection));
    } catch (e) {
      emit(PlayersFailure(errMsg: e.toString()));
    }
  }

  void toggleSelection(String playerId) {
    if (state is PlayersSuccess) {
      final currentPlayer = (state as PlayersSuccess).players;

      final newSelection = Set<String>.from(_currentSelection);
      if (newSelection.contains(playerId)) {
        newSelection.remove(playerId);
      } else {
        newSelection.add(playerId);
      }
      _currentSelection = newSelection;

      final sortedPlayers = _sortPlayers(currentPlayer, newSelection);
      emit(PlayersSuccess(players: sortedPlayers, selectedId: newSelection));
    }
  }

  List<PlayerModel> _sortPlayers(
      List<PlayerModel> players, Set<String> selection) {
    final sortedList = List<PlayerModel>.from(players);
    sortedList.sort((a, b) {
      final isASelected = selection.contains(a.id);
      final isBSelected = selection.contains(b.id);

      if (isASelected && !isBSelected) return -1;
      if (!isASelected && isBSelected) return 1;
      
      // Secondary Sort: Alphabetical
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return sortedList;
  }

  Future<void> addPlayer({required String name, String? imagePath}) async {
    try {
      var uniqueId = const Uuid().v4();
      PlayerModel newPlayer = PlayerModel(
        id: uniqueId,
        name: name.trim(),
        imagePath: imagePath,
      );
      await playersRepo.addPlayer(player: newPlayer);
      await fetchAllPlayers();
    } catch (e) {
      emit(PlayersFailure(errMsg: e.toString()));
    }
  }

  Future<void> deletePlayer(PlayerModel player) async {
    try {
      await playersRepo.deletePlayer(player: player);
      await fetchAllPlayers();
    } catch (e) {
      emit(PlayersFailure(errMsg: e.toString()));
    }
  }

  Future<void> editPlayer(
    PlayerModel player,
    String? name,
    String? imagePath,
  ) async {
    try {
      if (name != null) {
        player.name = name.trim();
      }
      if (imagePath != null) {
        player.imagePath = imagePath;
      }
      await playersRepo.updatePlayer(player: player);
      emit(PlayersLoading());
      await fetchAllPlayers();
    } catch (e) {
      emit(PlayersFailure(errMsg: 'Failed to update player: $e'));
    }
  }
}
