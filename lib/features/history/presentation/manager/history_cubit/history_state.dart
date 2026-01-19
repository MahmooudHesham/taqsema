part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

final class HistoryLoading extends HistoryState {}

final class HistoryEmpty extends HistoryState {}

final class HistorySuccess extends HistoryState {
  final List<MatchModel> matches;

  const HistorySuccess({required this.matches});
  @override
  List<Object> get props => [matches];
}

final class HistoryFailure extends HistoryState {
  final String errMsg;

  const HistoryFailure({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
