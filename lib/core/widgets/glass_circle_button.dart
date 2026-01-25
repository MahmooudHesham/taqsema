import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taqsema/core/widgets/glass_container.dart';

class GlassCircleButton extends StatelessWidget {
  const GlassCircleButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.size = 60,
    this.iconSize,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final double size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: size,
      height: size,
      //padding: EdgeInsets.zero,
      borderRadius: size / 2,
      child: IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(iconPath, fit: BoxFit.contain, width: iconSize),
      ),
    );
  }
}
