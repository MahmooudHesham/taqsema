import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/match/presentation/views/widgets/compact_players_list.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_bottom_bar.dart';

class GeneratedTeamsViewBody extends StatelessWidget {
  const GeneratedTeamsViewBody({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<String> teamA;
  final List<String> teamB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Row(
              children: [
                // ==== Left Side (Team A)====
                Expanded(
                  child: Column(
                    children: [
                      Text("Team A", style: AppStyles.textStyleBold32),
                      const SizedBox(height: 10),
                      Expanded(
                        child: CompactPlayersList(names: teamA, isTeamA: true),
                      ),
                    ],
                  ),
                ),

                // Spacing between teams
                const SizedBox(width: 15),

                // ==== Right Side (Team B)====
                Expanded(
                  child: Column(
                    children: [
                      Text("Team B", style: AppStyles.textStyleBold32),
                      const SizedBox(height: 10),
                      Expanded(
                        child: CompactPlayersList(names: teamB, isTeamA: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const GeneratedTeamsBottomBar(),
        ],
      ),
    );
  }
}
