part of 'players_cubit.dart';

sealed class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object> get props => [];
}

final class PlayersInitial extends PlayersState {}

final class PlayersLoading extends PlayersState {}

final class PlayersSuccess extends PlayersState {
  final List<PlayerModel> players;

  const PlayersSuccess({required this.players});
}

final class PlayersFailure extends PlayersState {
  final String errMsg;

  const PlayersFailure({required this.errMsg});
}
