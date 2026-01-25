import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/core/widgets/custom_empty_state.dart';
import 'package:taqsema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:taqsema/features/history/presentation/views/widgets/match_history_list_view.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          if (state is HistorySuccess) {
            return Column(
              children: [
                const SizedBox(height: 30),
                Text('Matches History', style: AppStyles.textStyleMedium24),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 50,
                      left: 50,
                      bottom: 100,
                    ),
                    child: MatchHistoryListView(matches: state.matches),
                  ),
                ),
              ],
            );
          } else if (state is HistoryEmpty) {
            return const Padding(
              padding: EdgeInsets.only(right: 20, left: 20, bottom: 80),
              child: CustomEmptyState(
                title: "No Matches Yet",
                subtitle:
                    "Start a game, track the score, and save your history here!",
                icon: Icons.sports_soccer,
              ),
            );
          } else if (state is HistoryFailure) {
            return Center(child: Text(state.errMsg));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
