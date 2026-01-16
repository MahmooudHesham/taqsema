import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/features/home/presentation/views/widgets/add_player_button.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generate_team_button.dart';

class HomeButtonOverlay extends StatelessWidget {
  const HomeButtonOverlay({
    super.key,
    required this.currentIndex,
    required this.onNavTap,
  });

  final int currentIndex;
  final ValueChanged<int> onNavTap;

  @override
  Widget build(BuildContext context) {
    final bool isHome = currentIndex == 0;
    final state = GoRouterState.of(context);
    final bool skipAnimation = state.extra == true;

    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Left Button
            _AnimatedFader(
              isVisible: isHome,
              skipAnimation: skipAnimation,
              child: const AddPlayerButton(),
            ),

            //Center Nav Bar
            CustomBottomNavBar(currentIndex: currentIndex, onTap: onNavTap),

            // Right Button
            _AnimatedFader(
              isVisible: isHome,
              skipAnimation: skipAnimation,
              child: const GenerateTeamButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedFader extends StatelessWidget {
  const _AnimatedFader({
    required this.isVisible,
    required this.child,
    this.skipAnimation = false,
  });

  final bool isVisible;
  final Widget child;
  final bool skipAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: skipAnimation
          ? Duration.zero
          : const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      opacity: isVisible ? 1.0 : 0.0,
      child: IgnorePointer(ignoring: !isVisible, child: child),
    );
  }
}
