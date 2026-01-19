import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/features/match/presentation/manager/match_cubit/match_cubit.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_bottom_bar.dart';
import 'package:t2sema/features/match/presentation/views/widgets/team_column.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';

class GeneratedTeamsViewBody extends StatefulWidget {
  const GeneratedTeamsViewBody({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<PlayerModel> teamA;
  final List<PlayerModel> teamB;

  @override
  State<GeneratedTeamsViewBody> createState() => _GeneratedTeamsViewBodyState();
}

class _GeneratedTeamsViewBodyState extends State<GeneratedTeamsViewBody> {
  late List<PlayerModel> copyOfTeamA;
  late List<PlayerModel> copyOfTeamB;

  @override
  void initState() {
    super.initState();

    copyOfTeamA = List.from(widget.teamA);
    copyOfTeamB = List.from(widget.teamB);
  }

  @override
  void didUpdateWidget(covariant GeneratedTeamsViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.teamA != oldWidget.teamA || widget.teamB != oldWidget.teamB) {
      setState(() {
        copyOfTeamA = List.from(widget.teamA);
        copyOfTeamB = List.from(widget.teamB);
      });
    }
  }

  void _movePlayer(PlayerModel player, {required bool toTeamA}) {
    setState(() {
      if (toTeamA) {
        copyOfTeamB.remove(player);
        copyOfTeamA.add(player);
      } else {
        copyOfTeamA.remove(player);
        copyOfTeamB.add(player);
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
                  players: copyOfTeamA,
                  isTeamA: true,
                  onPlayerDropped: (player) =>
                      _movePlayer(player, toTeamA: true),
                ),
              ),

              // ==== Right Side (Team B)====
              Expanded(
                child: _TeamDropZone(
                  title: 'Team B',
                  players: copyOfTeamB,
                  isTeamA: false,
                  onPlayerDropped: (player) =>
                      _movePlayer(player, toTeamA: false),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GeneratedTeamsBottomBar(
            onRegenerate: () {
              final allPlayers = [...widget.teamA, ...widget.teamB];

              context.read<MatchCubit>().generateTeams(allPlayers);
            },
          ),
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
  final List<PlayerModel> players;
  final bool isTeamA;
  final Function(PlayerModel) onPlayerDropped;

  @override
  Widget build(BuildContext context) {
    return DragTarget<PlayerModel>(
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
