import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_button.dart';

class GenerateTeamButton extends StatelessWidget {
  const GenerateTeamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassButton(
      title: 'Generate Teams',
      iconPath: 'iconPath',
      onTap: () {},
      width: 170,
    );
  }
}
