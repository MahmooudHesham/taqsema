import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/history/presentation/views/widgets/match_history_card.dart';
import 'package:t2sema/features/match/data/models/match_model.dart';

class MatchHistoryListView extends StatelessWidget {
  const MatchHistoryListView({super.key, required this.matches});
  final List<MatchModel> matches;
  @override
  Widget build(BuildContext context) {
    if (matches.isEmpty) {
      return Center(
        child: Text(
          "No Match History yet",
          style: AppStyles.textStyleRegular16,
        ),
      );
    }

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: matches.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final match = matches[index];
        return MatchHistoryCard(
          date: match.date,
          firstScore: match.firstScore,
          secondScore: match.secondScore,
          teamA: match.teamA,
          teamB: match.teamB,
        );
      },
    );
  }
}
