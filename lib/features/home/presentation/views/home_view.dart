import 'package:flutter/material.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_bottom_nav_bar.dart';
import 'package:t2sema/features/match/presentation/views/player_selection_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const PlayerSelectionView(),
    const HistoryView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          _pages[currentIndex],
          Align(
            alignment: Alignment.bottomCenter,

            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: CustomBottomNavBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
