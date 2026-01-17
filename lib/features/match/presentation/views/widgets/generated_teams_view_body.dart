import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_bottom_bar.dart';
import 'package:t2sema/features/match/presentation/views/widgets/team_column.dart';

class GeneratedTeamsViewBody extends StatefulWidget {
  const GeneratedTeamsViewBody({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<String> teamA;
  final List<String> teamB;

  @override
  State<GeneratedTeamsViewBody> createState() => _GeneratedTeamsViewBodyState();
}

class _GeneratedTeamsViewBodyState extends State<GeneratedTeamsViewBody> {
  void _movePlayer(String player, {required bool toTeamA}) {
    setState(() {
      if (toTeamA) {
        widget.teamB.remove(player);
        widget.teamA.add(player);
      } else {
        widget.teamA.remove(player);
        widget.teamB.add(player);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==== Left Side (Team A)====
              Expanded(
                child: _TeamDropZone(
                  title: 'Team A',
                  players: widget.teamA,
                  isTeamA: true,
                  onPlayerDropped: (player) =>
                      _movePlayer(player, toTeamA: true),
                ),
              ),

              // ==== Right Side (Team B)====
              Expanded(
                child: _TeamDropZone(
                  title: 'Team B',
                  players: widget.teamB,
                  isTeamA: false,
                  onPlayerDropped: (player) =>
                      _movePlayer(player, toTeamA: false),
                ),
              ),
            ],
          ),
        ),
        const SafeArea(
          top: false,
          minimum: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GeneratedTeamsBottomBar(),
        ),
      ],
    );
  }
}

class _TeamDropZone extends StatelessWidget {
  const _TeamDropZone({
    required this.title,
    required this.players,
    required this.isTeamA,
    required this.onPlayerDropped,
  });

  final String title;
  final List<String> players;
  final bool isTeamA;
  final Function(String) onPlayerDropped;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAcceptWithDetails: (details) => !players.contains(details.data),
      onAcceptWithDetails: (details) => onPlayerDropped(details.data),

      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;

        return AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isHovering
                ? AppColors.selected.withAlpha(50)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isHovering
                ? Border.all(
                    color: AppColors.primary.withAlpha(150),
                    width: 1.5,
                  )
                : Border.all(color: Colors.transparent, width: 1.5),
          ),
          child: TeamColumn(title: title, players: players, isTeamA: isTeamA),
        );
      },
    );
  }
}
