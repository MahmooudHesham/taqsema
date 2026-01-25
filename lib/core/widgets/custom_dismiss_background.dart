import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';

class CustomDismissBackground extends StatelessWidget {
  const CustomDismissBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: AppColors.error.withAlpha(150),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(Icons.delete, color: Colors.white, size: 30),
    );
  }
}
