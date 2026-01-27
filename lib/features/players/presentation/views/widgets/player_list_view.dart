import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/widgets/confirm_delete_dialog.dart';
import 'package:taqsema/core/widgets/custom_dismiss_background.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/core/widgets/haptic_list_view.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_card.dart';

class PlayersListView extends StatelessWidget {
  const PlayersListView({
    super.key,
    required this.players,
    required this.selectedPlayerIds,
    required this.onPlayerToggle,
  });

  final List<PlayerModel> players;
  final Set<String> selectedPlayerIds;
  final ValueChanged<String> onPlayerToggle;

  @override
  Widget build(BuildContext context) {
    return HapticListView(
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: players.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final player = players[index];
        final bool isSelected = selectedPlayerIds.contains(player.id);
        return Dismissible(
          key: Key(player.id),
          direction: DismissDirection.endToStart,
          background: const CustomDismissBackground(),
          confirmDismiss: (direction) {
            AppHaptics.heavyWarning();
            return showDeleteConfirmDialog(
              context: context,
              itemName: player.name,
            );
          },
          onDismissed: (direction) => _deletePlayer(context, player),
          child: PlayerCard(
            player: player,
            isSelected: isSelected,
            onTap: () {
              AppHaptics.selection();
              onPlayerToggle(player.id);
            },
          ),
        );
      },
    );
  }

  void _deletePlayer(BuildContext context, PlayerModel player) {
    context.read<PlayersCubit>().deletePlayer(player);
    showCustomSnackBar(context, message: "${player.name} deleted");
  }
}
