import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';
import 'package:t2sema/features/players/presentation/views/widgets/player_picture.dart';

class PlayerInfo extends StatelessWidget {
  const PlayerInfo({
    super.key,
    required this.image,
    required this.name,
    required this.isSelected,
  });

  final String? image;
  final String name;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withAlpha(100),
          radius: 32.5,
          child: PlayerPicture(image: image, name: name),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            name,
            style: AppStyles.textStyleRegular16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(isSelected ? Icons.check_box : Icons.check_box_outlined, size: 32),
      ],
    );
  }
}
