import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/widgets/glass_circle_button.dart';
import 'package:taqsema/core/widgets/glass_dialog.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_action_dialog.dart';

class AddPlayerButton extends StatelessWidget {
  const AddPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassCircleButton(
      iconPath: 'assets/icons/ic_add_player.svg',
      onTap: () {
        showAppDialog(
          context: context,
          child: BlocProvider.value(
            value: context.read<PlayersCubit>(),
            child: const PlayerActionDialog(),
          ),
        );
      },
    );
  }
}
