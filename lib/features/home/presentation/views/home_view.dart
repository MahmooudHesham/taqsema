import 'package:flutter/material.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:t2sema/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CustomAppBar(), body: HomeViewBody());
  }
}
