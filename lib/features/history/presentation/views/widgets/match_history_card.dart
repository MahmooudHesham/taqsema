import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

class MatchHistoryCard extends StatefulWidget {
  const MatchHistoryCard({
    super.key,
    required this.date,
    required this.firstScore,
    required this.secondScore,
    required this.teamA,
    required this.teamB,
  });

  final String date;
  final int firstScore, secondScore;
  final List<PlayerModel> teamA;
  final List<PlayerModel> teamB;

  @override
  State<MatchHistoryCard> createState() => _MatchHistoryCardState();
}

class _MatchHistoryCardState extends State<MatchHistoryCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppHaptics.buttonPress();
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.matchHistoryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.date,
                      style: AppStyles.textStyleLight20,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${widget.firstScore} - ${widget.secondScore}',
                    style: AppStyles.textStyleSemiBold20,
                  ),
                ],
              ),
            ),
            AnimatedCrossFade(
              firstChild: const SizedBox(width: double.infinity),
              secondChild: _buildTeams(),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeams() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left column (Team A)
          Expanded(
            child: _buildPlayerColumn(title: 'Team A', players: widget.teamA),
          ),

          // Right column (Team B)
          Expanded(
            child: _buildPlayerColumn(title: 'Team B', players: widget.teamB),
          ),
        ],
      ),
    );
  }

  Column _buildPlayerColumn({
    required String title,
    required List<PlayerModel> players,
  }) {
    return Column(
      children: [
        Text(title, style: AppStyles.textStyleRegular18),
        const SizedBox(height: 10),
        ...players.map(
          (player) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              player.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyleLight16,
            ),
          ),
        ),
      ],
    );
  }
}
