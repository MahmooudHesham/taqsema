part of 'match_cubit.dart';

sealed class MatchState extends Equatable {
  const MatchState();

  @override
  List<Object> get props => [];
}

final class MatchInitial extends MatchState {}

final class MatchLoading extends MatchState {}

final class MatchGenerated extends MatchState {
  final List<PlayerModel> teamA;
  final List<PlayerModel> teamB;

  const MatchGenerated({required this.teamA, required this.teamB});

  @override
  List<Object> get props => [teamA, teamB];
}

final class MatchFailure extends MatchState {
  final String errMsg;

  const MatchFailure({required this.errMsg});

  @override
  List<Object> get props => [errMsg];
}
