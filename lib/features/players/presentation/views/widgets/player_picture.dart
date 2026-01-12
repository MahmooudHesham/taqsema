import 'package:flutter/material.dart';
import 'package:t2sema/core/utils/app_styles.dart';

class PlayerPicture extends StatelessWidget {
  const PlayerPicture({super.key, required this.image, required this.name});

  final String? image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: image != null
          ? Image.asset(
              image!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            )
          : Center(
              child: Text(
                name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?',
                style: AppStyles.textStyleBold32,
              ),
            ),
    );
  }
}
