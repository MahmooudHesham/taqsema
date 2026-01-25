import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taqsema/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:taqsema/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: HomeViewBody(navigationShell: navigationShell),
    );
  }
}
