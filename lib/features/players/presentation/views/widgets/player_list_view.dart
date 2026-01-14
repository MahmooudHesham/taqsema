import 'package:flutter/material.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    super.key,
    required this.playerNames,
    required this.selectedIndices,
    required this.onPlayerToggle,
  });

  final List<String> playerNames;
  final Set<int> selectedIndices;
  final ValueChanged<int> onPlayerToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: playerNames.length,
      itemBuilder: (context, index) {
        final bool isSelected = selectedIndices.contains(index);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: PlayerCard(
            name: playerNames[index],
            // TODO: Replace with real image logic later
            image: index == 0
                ? 'assets/images/IMG-20220820-WA0029-01.jpeg'
                : null,
            isSelected: isSelected,
            onTap: () => onPlayerToggle(index),
          ),
        );
      },
    );
  }
}
