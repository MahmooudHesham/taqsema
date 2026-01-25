import 'package:hive_flutter/adapters.dart';
import 'package:taqsema/core/utils/constants.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/data/repos/players_repo.dart';

class PlayersRepoImpl extends PlayersRepo {
  @override
  Future<void> addPlayer({required PlayerModel player}) async {
    var box = Hive.box<PlayerModel>(kPlayersBox);
    await box.put(player.id, player);
  }

  @override
  Future<void> deletePlayer({required PlayerModel player}) async {
    await player.delete();
  }

  @override
  Future<List<PlayerModel>> getAllPlayers() async {
    var box = Hive.box<PlayerModel>(kPlayersBox);
    return box.values.toList();
  }

  @override
  Future<void> updatePlayer({required PlayerModel player}) async {
    await player.save();
  }
}
