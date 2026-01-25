import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/widgets/custom_empty_state.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_list_view.dart';

class PlayerSelectionView extends StatelessWidget {
  const PlayerSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayersCubit, PlayersState>(
      listener: (context, state) {
        if (state is PlayersFailure) {
          showCustomSnackBar(context, message: state.errMsg, isError: true);
        }
      },
      builder: (context, state) {
        if (state is! PlayersSuccess) {
          if (state is PlayersFailure) {
            return Center(child: Text(state.errMsg));
          }
          if (state is PlayersEmpty) {
            return _buildEmptyState(context);
          }
          return const Center(child: CircularProgressIndicator());
        }
        final players = state.players;
        final selectedIds = state.selectedId;

        if (state is PlayersEmpty) {
          return _buildEmptyState(context);
        }

        final sortedPlayers = List<PlayerModel>.from(players);
        sortedPlayers.sort((a, b) {
          final isASelected = selectedIds.contains(a.id);
          final isBSelected = selectedIds.contains(b.id);

          if (isASelected && !isBSelected) return -1;
          if (!isASelected && isBSelected) return 1;
          return 0;
        });
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'Player Selected #${selectedIds.length}',
                style: AppStyles.textStyleSemiBold16,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: PlayersListView(
                  players: sortedPlayers,
                  selectedPlayerIds: selectedIds,
                  onPlayerToggle: (id) {
                    context.read<PlayersCubit>().toggleSelection(id);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80, left: 20, right: 20),
      child: CustomEmptyState(
        title: 'Add Your Squad',
        subtitle: "Add players to start the match.",
        icon: Icons.groups_2_rounded,
      ),
    );
  }
}
