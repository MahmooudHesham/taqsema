import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/data/repos/players_repo.dart';
import 'package:uuid/uuid.dart';

part 'players_state.dart';

class PlayersCubit extends Cubit<PlayersState> {
  PlayersCubit(this.playersRepo) : super(PlayersInitial());
  final PlayersRepo playersRepo;

  Future<void> fetchAllPlayers() async {
    emit(PlayersLoading());
    try {
      List<PlayerModel> players = await playersRepo.getAllPlayers();
      emit(PlayersSuccess(players: players));
    } catch (e) {
      emit(PlayersFailure(errMsg: e.toString()));
    }
  }

  Future<void> addPlayer(String name) async {
    emit(PlayersLoading());
    try {
      var uniqueId = const Uuid().v4();
      PlayerModel newPlayer = PlayerModel(id: uniqueId, name: name);
      await playersRepo.addPlayer(player: newPlayer);
      await fetchAllPlayers();
    } catch (e) {
      emit(PlayersFailure(errMsg: e.toString()));
    }
  }
}
