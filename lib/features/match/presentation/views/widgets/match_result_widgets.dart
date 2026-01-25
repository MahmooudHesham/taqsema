import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';

class TeamScoreSelector extends StatelessWidget {
  const TeamScoreSelector({
    super.key,
    required this.teamName,
    required this.color,
    required this.score,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String teamName;
  final Color color;
  final int score;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(teamName, style: AppStyles.textStyleMedium16),
        const SizedBox(height: 15),
        Row(
          children: [
            StepperButton(
              icon: Icons.remove,
              color: AppColors.secondary,
              onTap: onDecrement,
            ),

            const SizedBox(width: 10),

            ScoreDisplayBox(color: color, score: score),

            const SizedBox(width: 10),

            StepperButton(
              icon: Icons.add,
              color: AppColors.primary,
              onTap: onIncrement,
            ),
          ],
        ),
      ],
    );
  }
}

class StepperButton extends StatelessWidget {
  const StepperButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });
  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withAlpha(60),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}

class ScoreDisplayBox extends StatelessWidget {
  const ScoreDisplayBox({super.key, required this.color, required this.score});

  final Color color;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(score.toString(), style: AppStyles.textStyleBold32),
      ),
    );
  }
}
