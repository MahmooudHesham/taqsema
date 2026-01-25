import 'package:get_it/get_it.dart';
import 'package:taqsema/features/history/presentation/manager/history_cubit/history_cubit.dart';
import 'package:taqsema/features/match/data/repos/match_repo.dart';
import 'package:taqsema/features/match/data/repos/match_repo_impl.dart';
import 'package:taqsema/features/players/data/repos/players_repo.dart';
import 'package:taqsema/features/players/data/repos/players_repo_impl.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<PlayersRepo>(PlayersRepoImpl());
  getIt.registerSingleton<MatchRepo>(MatchRepoImpl());
  getIt.registerSingleton<HistoryCubit>(
    HistoryCubit(getIt.get<MatchRepo>())..getAllMatches(),
  );
}
