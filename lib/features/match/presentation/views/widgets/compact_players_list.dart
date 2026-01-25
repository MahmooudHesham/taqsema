import 'package:flutter/material.dart';
import 'package:taqsema/features/match/presentation/views/widgets/compact_player_card.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

class CompactPlayersList extends StatelessWidget {
  const CompactPlayersList({
    super.key,
    required this.players,
    required this.isTeamA,
  });
  final List<PlayerModel> players;
  final bool isTeamA;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: players.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 15);
      },
      itemBuilder: (context, index) {
        return CompactPlayerCard(player: players[index], teamA: isTeamA);
      },
    );
  }
}
