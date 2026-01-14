import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class MatchHistoryCard extends StatelessWidget {
  const MatchHistoryCard({
    super.key,
    required this.date,
    required this.firstScore,
    required this.secondScore,
  });
  final String date;
  final int firstScore, secondScore;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.matchHistoryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                date,
                style: AppStyles.textStyleLight20,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '$firstScore - $secondScore',
              style: AppStyles.textStyleSemiBold20,
            ),
          ],
        ),
      ),
    );
  }
}
