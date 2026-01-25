import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_picture.dart';

class CompactPlayerCard extends StatelessWidget {
  const CompactPlayerCard({
    super.key,
    required this.player,
    required this.teamA,
  });
  final PlayerModel player;
  final bool teamA;
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<PlayerModel>(
      data: player,
      delay: const Duration(milliseconds: 100),
      feedback: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: 0.9,
          child: SizedBox(
            width: 180,
            child: _CardContent(teamA: teamA, player: player),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _CardContent(teamA: teamA, player: player),
      ),
      child: _CardContent(teamA: teamA, player: player),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({required this.teamA, required this.player});

  final bool teamA;
  final PlayerModel player;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: teamA ? AppColors.teamA : AppColors.teamB,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.drag_indicator),
          const SizedBox(width: 2),
          PlayerPicture(image: player.imagePath, name: player.name, radius: 17),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              player.name,
              style: AppStyles.textStyleRegular14,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
