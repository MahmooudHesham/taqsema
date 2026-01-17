import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_colors.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_picture.dart';

class CompactPlayerCard extends StatelessWidget {
  const CompactPlayerCard({
    super.key,
    required this.name,
    this.image,
    required this.teamA,
  });
  final String name;
  final String? image;
  final bool teamA;
  @override
  Widget build(BuildContext context) {
    return LongPressDraggable<String>(
      data: name,
      delay: const Duration(milliseconds: 100),
      feedback: Material(
        color: Colors.transparent,
        child: Opacity(
          opacity: 0.9,
          child: SizedBox(
            width: 180,
            child: _CardContent(teamA: teamA, image: image, name: name),
          ),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _CardContent(teamA: teamA, image: image, name: name),
      ),
      child: _CardContent(teamA: teamA, image: image, name: name),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({
    required this.teamA,
    required this.image,
    required this.name,
  });

  final bool teamA;
  final String? image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: teamA ? AppColors.teamA : AppColors.teamB,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.drag_indicator),
          const SizedBox(width: 2),
          PlayerPicture(image: image, name: name, radius: 17),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              name,
              style: AppStyles.textStyleRegular14,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
