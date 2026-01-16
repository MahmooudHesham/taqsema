import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/glass_circle_button.dart';
import 'package:t2sema/core/widgets/glass_dialog.dart';
import 'package:t2sema/features/players/presentation/views/widgets/add_player_dialog.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircleButton(
      iconPath: 'assets/icons/ic_add_player.svg',
      onTap: () {
        showAppDialog(context: context, child: const AddPlayerDialog());
      },
    );
  }
}
