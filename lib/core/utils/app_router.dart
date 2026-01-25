import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/core/utils/service_locator.dart';
import 'package:t2sema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/home_view.dart';
import 'package:t2sema/features/match/presentation/manager/match_cubit/match_cubit.dart';
import 'package:t2sema/features/match/presentation/views/generated_teams_view.dart';
import 'package:t2sema/features/match/presentation/views/player_selection_view.dart';
import 'package:t2sema/features/players/data/models/player_model.dart';
import 'package:t2sema/features/players/data/repos/players_repo.dart';
import 'package:t2sema/features/players/presentation/manager/players_cubit/players_cubit.dart';
import 'package:t2sema/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHome = '/home';
  static const kHistory = '/history';
  static const kGeneratedTeamsView = '/generated-teams';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => BlocProvider(
          create: (context) =>
              PlayersCubit(getIt.get<PlayersRepo>())..fetchAllPlayers(),
          child: HomeView(navigationShell: navigationShell),
        ),
        branches: [
          // Home branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kHome,
                builder: (context, state) => const PlayerSelectionView(),
              ),
            ],
          ),

          // History branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: kHistory,
                builder: (context, state) => BlocProvider.value(
                  value: getIt<HistoryCubit>(),
                  child: const HistoryView(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: kGeneratedTeamsView,
        builder: (context, state) {
          if (state.extra != null) {
            final data = state.extra as Map<String, dynamic>;
            final players = data['players'] as List<PlayerModel>;
            return BlocProvider(
              create: (context) => MatchCubit()..generateTeams(players),
              child: const GeneratedTeamsView(),
            );
          } else {
            return BlocProvider(
              create: (context) => MatchCubit()..loadActiveMatch(),
              child: const GeneratedTeamsView(),
            );
          }
        },
      ),
    ],
  );
}
