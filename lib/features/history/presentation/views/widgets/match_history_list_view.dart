import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taqsema/core/widgets/confirm_delete_dialog.dart';
import 'package:taqsema/core/widgets/custom_dismiss_background.dart';
import 'package:taqsema/core/widgets/custom_snack_bar.dart';
import 'package:taqsema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:taqsema/features/history/presentation/views/widgets/match_history_card.dart';
import 'package:taqsema/features/match/data/models/match_model.dart';

class MatchHistoryListView extends StatelessWidget {
  const MatchHistoryListView({super.key, required this.matches});
  final List<MatchModel> matches;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 120),
      itemCount: matches.length,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        final match = matches[index];
        return Dismissible(
          key: Key(match.key.toString()),
          direction: DismissDirection.endToStart,
          background: const CustomDismissBackground(),
          confirmDismiss: (direction) {
            return showDeleteConfirmDialog(
              context: context,
              itemName: 'this match',
            );
          },
          onDismissed: (direction) => _deleteMatch(context, match),
          child: MatchHistoryCard(
            date: DateFormat('dd/MM/yyyy').format(match.date),
            firstScore: match.firstScore,
            secondScore: match.secondScore,
            teamA: match.teamA,
            teamB: match.teamB,
          ),
        );
      },
    );
  }

  void _deleteMatch(BuildContext context, MatchModel match) {
    context.read<HistoryCubit>().deleteMatch(match);
    showCustomSnackBar(context, message: "Match deleted");
  }
}
