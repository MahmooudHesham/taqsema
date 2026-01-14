import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/history/presentation/views/widgets/match_history_card.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text('Matches History', style: AppStyles.textStyleMedium24),
            const SizedBox(height: 20),
            const MatchHistoryCard(),
          ],
        ),
      ),
    );
  }
}
