import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/core/widgets/custom_button.dart';
import 'package:t2sema/core/widgets/glass_dialog.dart';
import 'package:t2sema/features/home/presentation/views/widgets/match_result_dialog.dart';

class GeneratedTeamsBottomBar extends StatelessWidget {
  const GeneratedTeamsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionBtn(
            label: "Regenerate",
            color: AppColors.secondary,
            onTap: () {},
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: _ActionBtn(
            label: "Finish Match",
            color: AppColors.primary.withAlpha(200),
            onTap: () {
              showAppDialog(
                context: context,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: const MatchResultDialog(),
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
