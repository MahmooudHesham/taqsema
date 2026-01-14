import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class MatchHistoryCard extends StatelessWidget {
  const MatchHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: AppColors.matchHistoryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('12/12/2026', style: AppStyles.textStyleLight20),
            Text('10-6', style: AppStyles.textStyleLight20),
          ],
        ),
      ),
    );
  }
}
