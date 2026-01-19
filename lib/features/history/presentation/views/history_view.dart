import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/history/presentation/views/widgets/match_history_list_view.dart';
import 'package:t2sema/features/match/data/models/match_model.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerModel p1 = PlayerModel(id: '1', name: 'Ahmed', imagePath: null);
    final PlayerModel p2 = PlayerModel(
      id: '2',
      name: 'Mohamed',
      imagePath: null,
    );
    final PlayerModel p3 = PlayerModel(id: '3', name: 'Sayed', imagePath: null);
    final PlayerModel p4 = PlayerModel(id: '4', name: 'Omar', imagePath: null);
    final PlayerModel p5 = PlayerModel(id: '5', name: 'Ali', imagePath: null);
    final List<MatchModel> dummyMatches = [
      // Match 1: Close game
      MatchModel(
        date: "12/01/2026",
        firstScore: 8,
        secondScore: 7,
        teamA: [p1, p2, p3], // Ahmed, Mohamed, Sayed
        teamB: [p4, p5], // Omar, Ali
      ),

      // Match 2: Big win
      MatchModel(
        date: "05/01/2026",
        firstScore: 12,
        secondScore: 4,
        teamA: [p1, p5], // Ahmed, Ali
        teamB: [p2, p3, p4], // Mohamed, Sayed, Omar
      ),

      // Match 3: Draw
      MatchModel(
        date: "28/12/2025",
        firstScore: 6,
        secondScore: 6,
        teamA: [p2, p4],
        teamB: [p1, p3],
      ),
    ];
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text('Matches History', style: AppStyles.textStyleMedium24),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MatchHistoryListView(matches: dummyMatches),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
