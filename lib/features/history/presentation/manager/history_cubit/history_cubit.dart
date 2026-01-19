import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:t2sema/features/match/data/models/match_model.dart';
import 'package:t2sema/features/match/data/repos/match_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final MatchRepo matchRepo;
  HistoryCubit(this.matchRepo) : super(HistoryInitial());

  void getAllMatches() {
    emit(HistoryLoading());
    try {
      final matches = matchRepo.getAllMatches();

      if (matches.isEmpty) {
        emit(HistoryEmpty());
      } else {
        matches.sort((a, b) => b.date.compareTo(a.date));
        emit(HistorySuccess(matches: matches));
      }
    } catch (e) {
      emit(HistoryFailure(errMsg: 'Failed to load history: $e'));
    }
  }

  Future<void> deleteMatch(MatchModel match) async {
    try {
      await matchRepo.deleteMatch(match);
      getAllMatches();
    } catch (e) {
      getAllMatches();
    }
  }
}
