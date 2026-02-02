import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/widgets/custom_empty_state.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/features/match/presentation/views/widgets/squad_counter_header.dart';
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
        if (state is PlayersEmpty) {
          return _buildEmptyState(context);
        } else if (state is PlayersFailure) {
          return Center(child: Text(state.errMsg));
        } else if (state is PlayersSuccess) {
          return _buildPlayerContent(context, state);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildPlayerContent(BuildContext context, PlayersSuccess state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),
          SquadCounterHeader(count: state.selectedId.length),
          const SizedBox(height: 30),
          Expanded(
            child: PlayersListView(
              players: state.players,
              selectedPlayerIds: state.selectedId,
              onPlayerToggle: (id) {
                context.read<PlayersCubit>().toggleSelection(id);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 80, left: 20, right: 20),
      child: CustomEmptyState(
        title: 'Add Your Squad',
        subtitle: 'Add players to start the match.',
        icon: Icons.groups_2_rounded,
      ),
    );
  }
}
