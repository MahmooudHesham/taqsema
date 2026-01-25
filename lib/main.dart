import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taqsema/core/utils/constants.dart';
import 'package:taqsema/core/utils/service_locator.dart';
import 'package:taqsema/features/match/data/models/match_model.dart';
import 'package:taqsema/features/players/data/models/player_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarContrastEnforced: false,
    ),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(PlayerModelAdapter());
  Hive.registerAdapter(MatchModelAdapter());
  await Hive.openBox<PlayerModel>(kPlayersBox);
  await Hive.openBox<MatchModel>(kMatchesBox);
  await Hive.openBox(kActiveMatchBox);
  setupServiceLocator();

  runApp(const TaqsemaApp());
}

class TaqsemaApp extends StatelessWidget {
  const TaqsemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: 'Rubik',
          bodyColor: AppColors.primaryText,
          displayColor: AppColors.primaryText,
        ),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.teamA,
          secondary: AppColors.selected,
          surface: AppColors.background,
        ),
      ),
    );
  }
}
