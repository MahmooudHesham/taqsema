import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taqsema/core/utils/app_router.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/features/home/presentation/views/widgets/home_button_overlay.dart';
import 'package:taqsema/features/players/presentation/manager/players_cubit/players_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        navigationShell,

        BlocBuilder<PlayersCubit, PlayersState>(
          builder: (context, state) {
            bool isActive = false;
            VoidCallback? onGenerateTap;
            if (state is PlayersSuccess) {
              isActive = state.selectedId.length >= 2;

              onGenerateTap = () {
                if (!isActive) {
                  showCustomSnackBar(
                    context,
                    message: 'Select at least 2 players',
                    isError: true,
                  );
                  return;
                }
                final selectedPlayers = state.players
                    .where((element) => state.selectedId.contains(element.id))
                    .toList();
                context.push(
                  AppRouter.kGeneratedTeamsView,
                  extra: {'players': selectedPlayers},
                );
              };
            }
            return HomeButtonOverlay(
              currentIndex: navigationShell.currentIndex,
              onNavTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
              hasEnoughPlayer: isActive,
              onGeneratedTap: onGenerateTap ?? () {},
            );
          },
        ),
      ],
    );
  }
}
