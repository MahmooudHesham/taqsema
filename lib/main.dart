import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_router.dart';

void main() {
  runApp(const T2semaApp());
}

class T2semaApp extends StatelessWidget {
  const T2semaApp({super.key});

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
