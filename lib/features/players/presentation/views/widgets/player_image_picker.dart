import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taqsema/core/utils/app_colors.dart';
import 'package:taqsema/core/utils/app_styles.dart';

class PlayerImagePicker extends StatelessWidget {
  const PlayerImagePicker({
    super.key,
    this.image,
    required this.onTap,
    this.size = 120,
  });

  final File? image;
  final VoidCallback onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.selected, width: 2),
          color: image == null ? Colors.white.withAlpha(50) : null,
          image: image != null
              ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
              : null,
        ),
        child: image == null
            ? Center(
                child: Text(
                  "Add\nPhoto",
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyleRegular16,
                ),
              )
            : null,
      ),
    );
  }
}
