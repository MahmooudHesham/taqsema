import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_info.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.name,
    this.image,
    required this.isSelected,
    required this.onTap,
  });
  final String name;
  final String? image;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.selected : AppColors.notSelected,
          borderRadius: BorderRadius.circular(18),
        ),
        child: PlayerInfo(image: image, name: name, isSelected: isSelected),
      ),
    );
  }
}
