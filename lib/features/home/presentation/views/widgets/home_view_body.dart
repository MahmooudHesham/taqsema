import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/features/home/presentation/views/widgets/home_button_overlay.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        navigationShell,

        HomeButtonOverlay(
          currentIndex: navigationShell.currentIndex,
          onNavTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        ),
      ],
    );
  }
}
