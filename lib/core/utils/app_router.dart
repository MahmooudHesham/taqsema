import 'package:go_router/go_router.dart';
import 'package:t2sema/features/history/presentation/views/history_view.dart';
import 'package:t2sema/features/home/presentation/views/home_view.dart';
import 'package:t2sema/features/match/presentation/views/generated_teams_view.dart';

abstract class AppRouter {
  static const kGeneratedTeamsView = '/generated-teams';
  static const kHistoryView = '/history-view';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: kGeneratedTeamsView,
        builder: (context, state) {
          final data = state.extra as Map<String, List<String>>;

          final teamA = data['teamA'];
          final teamB = data['teamB'];

          return GeneratedTeamsView(teamA: teamA!, teamB: teamB!);
        },
      ),
      GoRoute(
        path: kHistoryView,
        builder: (context, state) => const HistoryView(),
      ),
    ],
  );
}
