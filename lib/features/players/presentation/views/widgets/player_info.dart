import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_styles.dart';
import 'package:taqsema/features/players/presentation/views/widgets/player_picture.dart';

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
        PlayerPicture(image: image, name: name),

        const SizedBox(width: 20),

        Expanded(
          child: Text(
            name,
            style: AppStyles.textStyleRegular16,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        Icon(
          isSelected ? Icons.check_box : Icons.check_box_outline_blank,
          size: 32,
        ),
      ],
    );
  }
}
