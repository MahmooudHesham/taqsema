import 'package:taqsema/features/players/data/models/player_model.dart';

abstract class PlayersRepo {
  Future<void> addPlayer({required PlayerModel player});
  Future<List<PlayerModel>> getAllPlayers();
  Future<void> deletePlayer({required PlayerModel player});
  Future<void> updatePlayer({required PlayerModel player});
}
