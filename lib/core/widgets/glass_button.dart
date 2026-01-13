import 'package:flutter/material.dart';
import 'package:t2sema/core/widgets/button_action.dart';
import 'package:t2sema/core/widgets/glass_container.dart';

class GlassButton extends StatelessWidget {
  const GlassButton({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.width,
  });

  final String title, iconPath;
  final VoidCallback onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassContainer(
        blurStrength: 1.5,
        width: width,
        height: 70,
        child: ButtonAction(title: title, iconPath: iconPath),
      ),
    );
  }
}
