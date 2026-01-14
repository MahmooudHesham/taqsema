import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/history/presentation/views/widgets/match_history_list_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});
  final List<String> matches = const [
    "4/4/2002",
    "19/4/2002",
    "19/12/2001",
    "19/8/2003",
    "18/12/2022",
  ];
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: MatchHistoryListView(matches: matches),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
