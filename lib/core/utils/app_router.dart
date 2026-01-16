import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/home_view.dart';
import 'package:t2sema/features/match/presentation/views/generated_teams_view.dart';
import 'package:t2sema/features/match/presentation/views/player_selection_view.dart';

abstract class AppRouter {
  static const kHome = '/home';
  static const kHistory = '/history';
  static const kGeneratedTeamsView = '/generated-teams';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: kHome,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeView(navigationShell: navigationShell);
        },
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
                builder: (context, state) => const HistoryView(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: kGeneratedTeamsView,
        builder: (context, state) {
          final data = state.extra as Map<String, List<String>>;
          return GeneratedTeamsView(
            teamA: data['teamA']!,
            teamB: data['teamB']!,
          );
        },
      ),
    ],
  );
}
