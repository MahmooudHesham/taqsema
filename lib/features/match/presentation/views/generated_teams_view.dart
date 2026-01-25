import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:t2sema/core/utils/app_router.dart';
import 'package:t2sema/core/widgets/custom_snack_bar.dart';
import 'package:t2sema/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:t2sema/features/match/presentation/manager/match_cubit/match_cubit.dart';
import 'package:t2sema/features/match/presentation/views/widgets/generated_teams_view_body.dart';

class GeneratedTeamsView extends StatelessWidget {
  const GeneratedTeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLeadingPressed: () async {
          await context.read<MatchCubit>().clearActiveMatch();
          if (context.mounted) {
            context.go(AppRouter.kHome);
          }
        },
      ),
      body: SafeArea(
        child: BlocConsumer<MatchCubit, MatchState>(
          listener: (context, state) {
            if (state is MatchFailure) {
              showCustomSnackBar(context, message: state.errMsg, isError: true);
            }
          },
          builder: (context, state) {
            if (state is MatchLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MatchGenerated) {
              return GeneratedTeamsViewBody(
                teamA: state.teamA,
                teamB: state.teamB,
              );
            }
            return const Center(child: Text('Something went wrong!'));
          },
        ),
      ),
    );
  }
}
