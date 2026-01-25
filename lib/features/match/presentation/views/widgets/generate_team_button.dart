import 'package:flutter/material.dart';
import 'package:taqsema/core/widgets/glass_circle_button.dart';

class GenerateTeamButton extends StatelessWidget {
  const GenerateTeamButton({
    super.key,
    required this.isActive,
    required this.onPressed,
  });

  final bool isActive;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isActive ? 1.0 : 0.5,
      child: GlassCircleButton(
        iconPath: 'assets/icons/ic_dice.svg',
        onTap: onPressed,
      ),
    );
  }
}
