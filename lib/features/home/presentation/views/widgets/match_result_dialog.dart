import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_router.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/core/widgets/custom_button.dart';
import 'package:t2sema/features/match/presentation/views/widgets/match_result_widgets.dart';

class MatchResultDialog extends StatefulWidget {
  const MatchResultDialog({super.key});

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
            Text("Match result", style: AppStyles.textStyleMedium18),
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
            TeamScoreSelector(
              teamName: 'Team A',
              color: AppColors.teamA,
              score: teamAScore,
              onIncrement: () => setState(() => teamAScore++),
              onDecrement: () =>
                  setState(() => teamAScore > 0 ? teamAScore-- : null),
            ),

            Column(
              children: [
                //  Invisible Text: Matches the height of "Team Name"
                Text(" ", style: AppStyles.textStyleMedium16),

                // 📏Same Spacer as inside TeamScore
                const SizedBox(height: 15),

                // Actual VS Text: Now it sits exactly between the buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "VS",
                    style: AppStyles.textStyleBold32.copyWith(fontSize: 28),
                  ),
                ),
              ],
            ),
            TeamScoreSelector(
              teamName: 'Team B',
              color: AppColors.teamB,
              score: teamBScore,
              onIncrement: () => setState(() => teamBScore++),
              onDecrement: () =>
                  setState(() => teamBScore > 0 ? teamBScore-- : null),
            ),
          ],
        ),

        const SizedBox(height: 30),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CustomButton(
            label: 'Confirm',
            onTap: () {
              context.go(AppRouter.kHistory, extra: true);
            },
          ),
        ),
      ],
    );
  }
}
