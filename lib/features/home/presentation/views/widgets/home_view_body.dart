import 'package:flutter/material.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/widgets/add_player_button.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:t2sema/features/home/presentation/views/widgets/generate_team_button.dart';
import 'package:t2sema/features/match/presentation/views/player_selection_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const PlayerSelectionView(),
    const HistoryView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _pages[currentIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AddPlayerButton(),
                CustomBottomNavBar(
                  currentIndex: currentIndex,
                  onTap: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                const GenerateTeamButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
