import 'package:hive_flutter/adapters.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/data/repos/players_repo.dart';

class PlayersRepoImpl extends PlayersRepo {
  static const String kPlayersBox = 'players_box';
  @override
  Future<void> addPlayer({required PlayerModel player}) async {
    var box = Hive.box<PlayerModel>(kPlayersBox);
    await box.put(player.id, player);
  }

  @override
  Future<void> deletePlayer({required String id}) async {
    var box = Hive.box<PlayerModel>(kPlayersBox);
    await box.delete(id);
  }

  @override
  Future<List<PlayerModel>> getAllPlayers() async {
    var box = Hive.box<PlayerModel>(kPlayersBox);
    return box.values.toList();
  }
}
