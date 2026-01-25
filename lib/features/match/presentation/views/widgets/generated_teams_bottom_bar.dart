import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_haptics.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/widgets/custom_button.dart';
import 'package:taqsema/core/widgets/glass_dialog.dart';
import 'package:taqsema/features/home/presentation/views/widgets/match_result_dialog.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

class GeneratedTeamsBottomBar extends StatelessWidget {
  const GeneratedTeamsBottomBar({
    super.key,
    required this.onRegenerate,
    required this.teamA,
    required this.teamB,
  });

  final VoidCallback onRegenerate;
  final List<PlayerModel> teamA, teamB;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionBtn(
            label: "Regenerate",
            color: AppColors.secondary,
            onTap: () {
              AppHaptics.buttonPress();
              onRegenerate();
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _ActionBtn(
            label: "Finish Match",
            color: AppColors.primary.withAlpha(200),
            onTap: () {
              AppHaptics.buttonPress();
              showAppDialog(
                context: context,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: MatchResultDialog(teamA: teamA, teamB: teamB),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      label: label,
      color: color,
      onTap: onTap,
      textStyle: AppStyles.textStyleMedium16,
    );
  }
}
