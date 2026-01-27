import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/widgets/glass_dialog.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_action_dialog.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_info.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.player,
    required this.isSelected,
    required this.onTap,
  });
  final PlayerModel player;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: () {
        showAppDialog(
          context: context,
          child: BlocProvider.value(
            value: context.read<PlayersCubit>(),
            child: PlayerActionDialog(player: player),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.selectedWithAlpha
              : AppColors.notSelected,
          borderRadius: BorderRadius.circular(16),
        ),
        child: PlayerInfo(
          image: player.imagePath,
          name: player.name,
          isSelected: isSelected,
        ),
      ),
    );
  }
}
