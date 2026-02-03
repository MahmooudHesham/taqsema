part of 'players_cubit.dart';

sealed class PlayersState extends Equatable {
  const PlayersState();

  @override
  List<Object?> get props => [];
}

final class PlayersInitial extends PlayersState {}

final class PlayersLoading extends PlayersState {}

final class PlayersSuccess extends PlayersState {
  final List<PlayerModel> players;
  final Set<String> selectedId;
  final int version;
  const PlayersSuccess({
    required this.players,
    this.selectedId = const {},
    this.version = 0,
  });

  @override
  List<Object?> get props => [players, selectedId, version];
}

final class PlayersFailure extends PlayersState {
  final String errMsg;

  const PlayersFailure({required this.errMsg});

  @override
  List<Object?> get props => [errMsg];
}

final class PlayersEmpty extends PlayersState {}
