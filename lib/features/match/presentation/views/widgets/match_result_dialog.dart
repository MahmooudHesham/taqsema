import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/utils/app_router.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/utils/constants.dart';
import 'package:taqsema/core/utils/service_locator.dart';
import 'package:taqsema/core/widgets/custom_button.dart';
import 'package:taqsema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:taqsema/features/match/data/models/match_model.dart';
import 'package:taqsema/features/match/presentation/views/widgets/match_result_widgets.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

class MatchResultDialog extends StatefulWidget {
  const MatchResultDialog({
    super.key,
    required this.teamA,
    required this.teamB,
  });
  final List<PlayerModel> teamA, teamB;

  @override
  State<MatchResultDialog> createState() => _MatchResultDialogState();
}

class _MatchResultDialogState extends State<MatchResultDialog> {
  int teamAScore = 0;
  int teamBScore = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Text('Match result', style: AppStyles.textStyleMedium18),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.close, color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TeamScoreSelector(
                teamName: 'Team A',
                color: AppColors.teamA,
                score: teamAScore,
                onIncrement: () => setState(() => teamAScore++),
                onDecrement: () =>
                    setState(() => teamAScore > 0 ? teamAScore-- : null),
              ),
            ),

            Column(
              children: [
                //  Invisible Text: Matches the height of "Team Name"
                Text(' ', style: AppStyles.textStyleMedium16),

                // 📏Same Spacer as inside TeamScore
                const SizedBox(height: 15),

                // Actual VS Text: Now it sits exactly between the buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'VS',
                      style: AppStyles.textStyleBold32.copyWith(fontSize: 28),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TeamScoreSelector(
                teamName: 'Team B',
                color: AppColors.teamB,
                score: teamBScore,
                onIncrement: () => setState(() => teamBScore++),
                onDecrement: () =>
                    setState(() => teamBScore > 0 ? teamBScore-- : null),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(
            label: 'Confirm',
            onTap: () async {
              AppHaptics.buttonPress();
              MatchModel newMatch = MatchModel(
                date: DateTime.now(),
                firstScore: teamAScore,
                secondScore: teamBScore,
                teamA: widget.teamA,
                teamB: widget.teamB,
              );
              getIt<HistoryCubit>().saveMatch(newMatch);

              // Clear active match
              await Hive.box(kActiveMatchBox).clear();

              if (context.mounted) {
                context.go(AppRouter.kHistory);
              }
            },
          ),
        ),
      ],
    );
  }
}
