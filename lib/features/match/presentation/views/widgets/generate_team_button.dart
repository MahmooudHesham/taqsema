import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/core/utils/app_router.dart';
import 'package:t2sema/core/widgets/glass_circle_button.dart';

class GenerateTeamButton extends StatelessWidget {
  const GenerateTeamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircleButton(
      iconPath: 'assets/icons/ic_generate.svg',
      onTap: () {
        final dummyA = [
          "Mahmoud",
          "Salah",
          "Nasooh",
          "Messi",
          "Anass",
          "Hamed",
        ];
        final dummyB = [
          "Ronaldo",
          "Nussairy",
          "ElKholy",
          "Mbappe",
          "Muhammed AlKaddy",
          "Ahmed Hesham",
        ];
        context.push(
          AppRouter.kGeneratedTeamsView,
          extra: {'teamA': dummyA, 'teamB': dummyB},
        );
      },
    );
  }
}
